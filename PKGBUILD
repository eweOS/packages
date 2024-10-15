# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(texlive-bin libsynctex)
pkgver=20240312
pkgrel=1
license=(GPL-2.0-or-later)
arch=(x86_64 aarch64 riscv64)
makedepends=(bash
             cairo
             clisp
             fontconfig
             freetype2
             gd
             git
             gmp
             graphite
             harfbuzz
             icu
             libjpeg-turbo
             libpaper
             libpng
             libsigsegv
             libunistring
             libxcrypt
             mpfr
             ncurses
             perl
             pixman
             potrace
             readline
             zlib
             zziplib)
url='https://tug.org/texlive/'
source=("https://mirrors.nju.edu.cn/tex-historic/systems/texlive/${pkgver:0:4}/texlive-$pkgver-source.tar.xz")
sha256sums=('7b6d87cf01661670fac45c93126bed97b9843139ed510f975d047ea938b6fe96')

prepare() {
  cd texlive-$pkgver-source

# bibtex-x needs kpathsea flags
  sed -i '/AC_SEARCH_LIBS/a KPSE_KPATHSEA_FLAGS' texk/bibtex-x/configure.ac
  (cd texk/bibtex-x && autoreconf)
# t4ht expects to be un /usr/share/texmf/bin/t4ht (FS#27251)
  sed -i s/SELFAUTOPARENT/TEXMFROOT/ texk/tex4htk/t4ht.c
}

build() {
  cd texlive-$pkgver-source

  export CC=cc CXX=c++

  mkdir -p build
  cd build
  CFLAGS+=" -Wno-incompatible-pointer-types" \
  ax_cv_c_float_words_bigendian=no \
  ../configure --prefix=/usr -C \
    --sysconfdir=/etc \
    --datarootdir=/usr/share \
    --datadir=/usr/share \
    --mandir=/usr/share/man \
    --disable-native-texlive-build \
    --with-banner-add="/eweOS" \
    --disable-multiplatform \
    --disable-dialog \
    --disable-psutils \
    --disable-t1utils \
    --disable-bibtexu \
    --disable-dvisvgm \
    --disable-xz \
    --enable-shared \
    --disable-static \
    --with-system-zlib \
    --with-system-zziplib \
    --with-system-pnglib \
    --with-system-ncurses \
    --with-system-t1lib \
    --with-system-gd \
    --with-system-freetype2 \
    --with-system-pixman \
    --with-system-cairo \
    --with-system-harfbuzz \
    --with-system-graphite \
    --with-system-icu \
    --with-system-gmp \
    --with-system-mpfr \
    --with-system-potrace \
    --with-system-libpaper \
    --with-freetype2-libdir=/usr/lib \
    --with-freetype2-include=/usr/include/freetype2 \
    --with-xdvi-x-toolkit=xaw \
    --disable-dump-share \
    --with-clisp-runtime=default \
    --without-x \
    --disable-xpdfopen \
    --disable-xindy-rules \
    --disable-xindy-docs \
    --disable-luajittex --disable-luajithbtex --disable-mfluajit
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libsynctex() {
  pkgdesc='Library for synchronization between TeX files and resulting file'
  depends=(zlib)
  provides=(libsynctex.so)

  cd texlive-$pkgver-source/build
  make -C texk/web2c DESTDIR="$pkgdir" \
    install-data-am install-libLTLIBRARIES

# remove docs included in texlive-doc
  rm -r "$pkgdir"/usr/share/man
}

package_texlive-bin() {
  pkgdesc='TeX Live binaries'
  depends=(bash
           cairo libcairo.so
           fontconfig libfontconfig.so
           freetype2 libfreetype.so
           gd # libgd.so
           gmp
           graphite libgraphite2.so
           harfbuzz libharfbuzz.so
           icu libicui18n.so libicuuc.so
           libpaper # libpaper.so
           libpng libpng16.so
           libsigsegv # libsigsegv.so
           libsynctex libsynctex.so
           libunistring libunistring.so
           libxcrypt libcrypt.so
           mpfr libmpfr.so
           ncurses libncursesw.so
           perl
           pixman libpixman-1.so
           potrace # libpotrace.so
           readline libreadline.so
           zlib libz.so
           zziplib) # libzzip-0.so
  provides=(lcdf-typetools
            libptexenc.so
            libtexlua53.so
            libtexluajit.so
            kpathsea
            xindy)
  optdepends=('psutils: to manipulate the output of dvips')

  cd texlive-$pkgver-source

  cd build
  make DESTDIR="$pkgdir" texmf="$pkgdir"/usr/share/texmf install
  LD_LIBRARY_PATH="$pkgdir"/usr/lib \
  make DESTDIR="$pkgdir" texlinks

# remove stuff included in texlive-texmf
  rm -r "$pkgdir"/usr/share/texmf-dist

# remove docs included in texlive-doc
  rm -r "$pkgdir"/usr/share/{info,man}

# remove links to scripts
  for _link in $(ls "$pkgdir"/usr/bin); do
    [[ $(readlink "$pkgdir"/usr/bin/$_link) == */scripts/* ]] && _rmlinks+="$pkgdir/usr/bin/$_link "
  done
  rm $_rmlinks

# remove libsynctex
  rm "$pkgdir"/usr/include/synctex/*
  rm "$pkgdir"/usr/lib/libsynctex.*
  rm "$pkgdir"/usr/lib/pkgconfig/synctex.pc
}
