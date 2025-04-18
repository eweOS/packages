# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.4.309.0
pkgrel=1
pkgdesc="SPIR-V Headers"
_pkgpfx=vulkan-sdk
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/${_pkgpfx}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('545526940e5b42a53143732d6d00b61ee544f8137507f86b32230fb5110cf2cc8f3fc71d0b167e614ab2dd5faa1c4915965627146d519832d73f23ee6a2aa4bb')

build() {
  cmake -B build -S ${_pkg}-${_pkgpfx}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-${_pkgpfx}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
