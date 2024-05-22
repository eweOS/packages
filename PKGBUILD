# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=ghostscript
pkgname=(ghostscript ghostxps ghostpcl)
pkgver=10.03.1
pkgrel=1
pkgdesc="An interpreter for the PostScript language"
url="https://www.ghostscript.com/"
arch=(x86_64 aarch64 riscv64)
license=('AGPL-3.0-or-later')
depends=('libcups' 'fontconfig' 'zlib' 'libpng' 'libjpeg' 'jbig2dec'
         'libtiff' 'lcms2' 'libpaper' 'openjpeg2' 'libidn'
         'cairo' 'gdk-pixbuf' 'glib2')
makedepends=('gtk3')
# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases
source=(https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${pkgver//./}/ghostpdl-${pkgver}.tar.xz
        #https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/ghostpdl-${pkgver/.0//}/ghostpdl-${pkgver}.tar.xz
        2010_add_build_timestamp_setting.patch
        0001_No_output_visible_with_pdfwriter.diff)
# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10031/SHA512SUMS
sha512sums=('3aca7834789bf11582391138bbae99b2ef5d9f1e89db9f838ebef0ed86015deb5c8cf93d0ffe25ad8aa1aa99eda9ecd384cbd59b0d21719cd960261c043044f9'
            'cd7794ee4f28b11177021b950196385200b610127ed6cb94a45e3202b690b721a0dfcc0276ff39448d4dab64c1b31a76e6c323696a8315aad9edc22077f18a3d'
            '659077a7e60b6c56cf3f2e70fbfc5a7114e1294e7a912e40bce9d7e34f1907fff6e407be6c528961c06e7de5c80c637584929d08ade63b277793284b8b56208d')

### update jbig2dec first! ###


prepare() {
  cd ghostpdl-${pkgver}

  # *** remove after final decision ***
  # new in 9.54.0: 
  # https://www.ghostscript.com/doc/9.54.0/News.htm

  # 1) inclusion of the tesseract/leptonica sources for OCR capabilities
  # at the moment we do not support linking with tesseract/leptonica shared libraries. 
  # As is normal with such included libraries, deleting those directories and (re)running
  # configure (on Unix like systems) will automatically build without the OCR functionality.
  # increases package size ghostpcl 2.7->4.9MB | ghostscript 18->23MB | ghostxps 2,7->4.9MB
  # https://www.ghostscript.com/doc/9.54.0/VectorDevices.htm#UseOCR - 
  # this doesn't seem to be worth to keep enabled until linking with shared libs is supported
  rm -r tesseract leptonica

  # 2) new directory addition in the source tree: "extract/". 
  # It contains the implementation for the writing of docx format files used by the
  # new "docxwrite" device. This is *not* a "thirdparty library". 
  # For distribution package maintainers, if you want your packaged Ghostscript to include
  # the "docxwrite" device, do not delete this directory.
  # ^ this one doesn't affect package size - so let's keep it

  # force it to use system-libs
  rm -r cups/libs expat ijs jbig2dec jpeg lcms2mt libpng openjpeg tiff zlib
  # using tree freetype because of https://bugs.archlinux.org/task/56849
  # lcms2mt is the new lcms2 fork aimed to replace lcms2 in a thread safe way
  
  # http://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=40dc5b409c6262b18b4bf5386b5482ead4c511e3
  # libs link unwanted to libgpdl that isn't installed
  rm -rf gpdl
  
  # Remove internal CMaps (CMaps from poppler-data are used instead)
  rm -r Resource/CMap

  # Debian: # allow the build timestamp to be externally set
  patch -Np1 -i ../2010_add_build_timestamp_setting.patch

  # https://bugs.ghostscript.com/show_bug.cgi?id=707655
  patch -Np1 -i ../0001_No_output_visible_with_pdfwriter.diff
}

build() {
  cd ghostpdl-${pkgver}

  # gcc14 buildfix
  export CFLAGS+=" -Wno-incompatible-pointer-types -Wno-int-conversion"
#  export CXXFLAGS+=" -Wno-incompatible-pointer-types -Wno-int-conversion"

  ./configure --prefix=/usr \
	      --with-jbig2dec \
              --with-drivers=ALL \
              --with-fontpath=/usr/share/fonts/gsfonts \
              --without-versioned-path \
              --enable-fontconfig \
              --enable-freetype \
              --enable-openjpeg \
              --with-system-libtiff \
              --with-libpaper \
              --disable-compile-inits #--help # needed for linking with system-zlib
  make so
}

package_ghostscript() {
  optdepends=('gtk3:              needed for gsx')

  cd ghostpdl-${pkgver}
  make -j1 DESTDIR="${pkgdir}" soinstall
  # split pkg cleanup
  rm -v "${pkgdir}"/usr/bin/{gpcl6*,gxps*}
  rm -v "${pkgdir}"/usr/lib/{libgpcl6*,libgxps.so*}

  # gsc collides with gambit gambit-c
  mv "${pkgdir}"/usr/bin/{gsc,gs}
  ln -s gs "${pkgdir}"/usr/bin/ghostscript
  ln -s /usr/share/man/man1/gs.1.gz "${pkgdir}"/usr/share/man/man1/ghostscript.1

  # remove obsolete lpr bsd/Unix related files
  rm -rv "${pkgdir}"/usr/bin/{lprsetup.sh,unix-lpr.sh}

  # install the CMaps from poppler-data
  ln -s /usr/share/poppler/cMap "${pkgdir}"/usr/share/ghostscript/Resource/CMap

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
}

package_ghostxps() {
  pkgdesc="${pkgdesc/PostScript/XPS document}"
  depends=("ghostscript=${pkgver}-${pkgrel}")

  cd ghostpdl-${pkgver}
  make DESTDIR="${pkgdir}" install-gxps install-so-gxps
  rm -r "${pkgdir}"/usr/include

  # fix file conflict - FS#70238
  rm -r "${pkgdir}"/usr/lib/libgxps.so
  
  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
}

package_ghostpcl() {
  pkgdesc="${pkgdesc/PostScript/PCL 6}"
  depends=("ghostscript=${pkgver}-${pkgrel}")

  cd ghostpdl-${pkgver}
  make DESTDIR="${pkgdir}" install-gpcl6 install-so-gpcl6
  rm -r "${pkgdir}"/usr/include

  install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m644 LICENSE
}
