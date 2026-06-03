# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.4.350.0
pkgrel=1
pkgdesc="SPIR-V Headers"
_pkgpfx=vulkan-sdk
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/${_pkgpfx}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5a91928cecb4b4fcf4badffc2e20ba93803f7bb0f3e5bf0f92eba18e689b856b80885bcc61838cadf76423b872952465c53da76ecec0b73164dad1a391192c28')

build() {
  cmake -B build -S ${_pkg}-${_pkgpfx}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-${_pkgpfx}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
