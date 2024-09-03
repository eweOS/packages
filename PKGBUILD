# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.3.290.0
pkgrel=1
pkgdesc="SPIR-V Headers"
_pkgpfx=vulkan-sdk
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/${_pkgpfx}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d3328cd4ddf87d075afacfb7ada01dbd16a3ff39b831e9ebe4ce3c32af0ff0c8822811b0e0d273a54b4acaba29b63b099efcf0150424bd9074d24d04a9974d89')

build() {
  cmake -B build -S ${_pkg}-${_pkgpfx}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-${_pkgpfx}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
