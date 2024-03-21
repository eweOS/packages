# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.3.280.0
pkgrel=1
pkgdesc="SPIR-V Headers"
_pkgpfx=vulkan-sdk
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/${_pkgpfx}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6c20022df343e900793370cb30ccea6f4e64f42f4f7c495a0fbb9d3c5fcf3c15a173b93fe883e407d40f8c6dd9d0a6853d8a6907e3df5aa61ad48ae8485019e8')

build() {
  cmake -B build -S ${_pkg}-${_pkgpfx}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-${_pkgpfx}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
