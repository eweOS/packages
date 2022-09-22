# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=1
pkgver=1.3.224.1
pkgrel=1
pkgdesc="SPIR-V Headers"
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('SKIP')

build() {
  cmake -B build -S ${_pkg}-sdk-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr .
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-sdk-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
