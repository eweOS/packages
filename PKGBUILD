# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=jasper
pkgname=(jasper)
pkgver=4.2.9
pkgrel=2
pkgdesc='Software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard'
url='https://www.ece.uvic.ca/~frodo/jasper/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LicenseRef-JasPer2.0')
makedepends=(
  cmake
  libjpeg-turbo
)
source=(https://github.com/mdadams/jasper/archive/version-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5c74521150f49a1055b909e01629ced3b97f222d0d81b0f5b42dcca4915fff11a11e247cc1ec37bcb669b819812892c950ec980275cbebe9897a2aec8b52ab3d')

prepare() {
  cd ${pkgbase}-version-${pkgver}
  sed -r 's|(CMAKE_SKIP_BUILD_RPATH) FALSE|\1 TRUE|g' -i CMakeLists.txt
}

build() {
  cmake \
    -B buildx -S ${pkgbase}-version-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DJAS_ENABLE_OPENGL=ON \
    -DJAS_ENABLE_LIBJPEG=ON \
    -DJAS_ENABLE_AUTOMATIC_DEPENDENCIES=OFF \
    -DCMAKE_SKIP_RPATH=ON \
    -DJAS_ENABLE_SHARED=ON
  cmake --build buildx
}

check() {
  export LD_LIBRARY_PATH="$(pwd)/buildx/src/libjasper/"
  make -C buildx -j1 test
}

package_jasper() {
  depends=(
    libglvnd
    libjpeg-turbo
  )
  optdepends=('jasper-doc: documentation')
  provides=('libjasper.so')

  make -C buildx DESTDIR="${pkgdir}" install

  install -Dm 644 ${pkgbase}-version-${pkgver}/{NEWS.txt,README.md}  -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 ${pkgbase}-version-${pkgver}/LICENSE.txt  -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
