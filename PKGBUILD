# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.3.246.1
pkgrel=1
pkgdesc="SPIR-V Headers"
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/sdk-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('436c6ce11d918091ce4a5ef2821f51af811c9a289e220b4a2b0bb4417b1f9f3b1f56a6366cfdf56848a9b1fb612ee3ba31d35c3d73d3d24de964ee05f96a7bbc')

build() {
  cmake -B build -S ${_pkg}-sdk-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-sdk-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
