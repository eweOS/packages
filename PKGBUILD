# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=freeimage
pkgver=3.18.0
pkgrel=2
pkgdesc="Library project for developers who would like to support popular graphics image formats"
arch=(x86_64 aarch64 riscv64)
license=('GPL' 'custom:FIPL')
url="http://freeimage.sourceforge.net/"
depends=('libjpeg' 'openexr' 'openjpeg2' 'libwebp' 'libraw' 'libtiff' 'jxrlib')
makedepends=('mesa' 'glu')
source=("https://downloads.sourceforge.net/project/freeimage/Source%20Distribution/${pkgver}/FreeImage${pkgver//./}.zip"
        freeimage-unbundle.patch
        freeimage-libraw-0.20.patch
        freeimage-libraw-0.21.patch
	fix-musl.patch)
sha256sums=('f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd'
            'b42e799f7e97c2c71a00a7f352c23ecff56ebb36077b7fd5a8866f46b5d01094'
            '71c25974c25dfced11b08206aae6e759675b53bae061be5f34fa1107beec9233'
            'cacb6ae3a2cebf8208d34ea01423a5309ee88ff649afbbb371e49cfeb57d8331'
            'd7c5844dbccf73500a608ca6e0edf8e626257123a12b3e5a974e2a805fcff3e7')

prepare() {
  cd FreeImage

  # TODO: This will only compile against libjpeg-turbo 2 but we will wait for that :D
  patch -p1 -i ../freeimage-unbundle.patch # Unbundle libraries (Fedora)
  rm -r Source/Lib* Source/ZLib Source/OpenEXR
  # can't be built due to private headers
  > Source/FreeImage/PluginG3.cpp
  > Source/FreeImageToolkit/JPEGTransform.cpp

  patch -p1 -i ../freeimage-libraw-0.20.patch # Fix build with libraw 0.20
  patch -p1 -i ../freeimage-libraw-0.21.patch # Fix build with libraw 0.21

  patch -p1 -i ../fix-musl.patch

  sed -i 's/std::auto_ptr/std::unique_ptr/' Source/FreeImage/MultiPage.cpp
}

build() {
  cd FreeImage
  sh gensrclist.sh
  sh genfipsrclist.sh

  case $CARCH in
    aarch64|riscv64) 
    export CFLAGS="$CFLAGS -fPIC"
    export CXXFLAGS="$CXXFLAGS -fPIC" ;;
    x86_64) ;;
    *)
      echo "check whether -fPIC is needed on $CARCH"
      return 1 ;;
  esac

  make -f Makefile.gnu
  make -f Makefile.fip
}

package() {
  cd FreeImage
  make -f Makefile.gnu DESTDIR="${pkgdir}" install
  make -f Makefile.fip DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/FreeImage/license-fi.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
