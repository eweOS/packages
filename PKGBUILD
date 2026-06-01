# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=imagemagick
pkgver=7.1.2.18
pkgrel=4
_relname=ImageMagick-${pkgver%%.*}
_tarname=ImageMagick-${pkgver%.*}-${pkgver##*.}
pkgdesc='An image viewing/manipulation program'
url='https://www.imagemagick.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
depends=(bzip2
         cairo
         fftw
         fontconfig
         freetype2
         glib2
         lcms2
         liblqr
         libltdl
         libpng
         libraqm
         libxml2
         libzip
         xz
         zlib)
optdepends=('ghostscript: PS/PDF support'
            'jbigkit: JBIG support'
            'libheif: HEIF support'
            'libjpeg-turbo: JPEG support'
            'libjxl: JPEG XL support'
            'libraw: DNG support'
            'librsvg: SVG support'
            'libtiff: TIFF support'
            'libultrahdr: UHDR support'
            'libwebp: WEBP support'
            'libwmf: WMF support'
            'ocl-icd: OpenCL support'
            'openexr: OpenEXR support'
            'openjpeg2: JPEG2000 support'
            'djvulibre: DJVU support'
            'pango: Text rendering')
options+=(!emptydirs libtool)
backup=(etc/$_relname/{colors,delegates,log,mime,policy,quantization-table,thresholds,type,type-{dejavu,ghostscript}}.xml)
provides=(libmagick)
makedepends=(chrpath
             djvulibre
             ghostscript
             glu
             jbigkit
             libheif
             libjpeg-turbo
             libjxl
             libraw
             librsvg
             libwebp
             libwmf
             opencl-headers
             openexr
             openjpeg2)
checkdepends=(gsfonts
              ttf-dejavu)
replaces=(imagemagick-doc)
source=(https://imagemagick.org/archive/releases/$_tarname.tar.xz)
sha256sums=('abb85df40f06fddf17d031629c7ad2778a55d478a8bff80d55ffee75c90a3982')

build() {
  cd $_tarname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --disable-static \
    --with-dejavu-font-dir=/usr/share/fonts/TTF \
    --with-gs-font-dir=/usr/share/fonts/gsfonts \
    PSDelegate=/usr/bin/gs \
    XPSDelegate=/usr/bin/gxps \
    PCLDelegate=/usr/bin/gpcl6 \
    --enable-hdri \
    --enable-opencl \
    --without-gslib \
    --with-djvu \
    --with-fftw \
    --with-jxl \
    --with-lqr \
    --with-modules \
    --with-openexr \
    --with-openjp2 \
    --with-perl \
    --with-perl-options='INSTALLDIRS=vendor INSTALL_BASE=' \
    --with-rsvg \
    --with-webp \
    --with-wmf \
    --with-xml \
    --without-autotrace \
    --without-dps \
    --without-fpx \
    --without-gcc-arch \
    --without-gvc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  make
}

check() (
  cd $_tarname
  ulimit -n 4096
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  make check
)

package() {
  cd $_tarname
  # do not use slibtools since it removes libtool .la files
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  make DESTDIR="$pkgdir" install

  find "$pkgdir/usr/lib/perl5" -name '*.so' -exec chrpath -d {} +
  rm "$pkgdir"/etc/$_relname/type-{apple,urw-base35,windows}.xml
  rm "$pkgdir"/usr/lib/*.la

  install -Dm644 LICENSE NOTICE -t "$pkgdir"/usr/share/licenses/$pkgname
}
