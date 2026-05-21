# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkg=SPIRV-Headers
pkgname=spirv-headers
epoch=2
pkgver=1.4.341.0
pkgrel=2
pkgdesc="SPIR-V Headers"
_pkgpfx=vulkan-sdk
arch=(any)
url="https://www.khronos.org/registry/spir-v/"
license=(MIT)
makedepends=(cmake)
source=(https://github.com/KhronosGroup/SPIRV-Headers/archive/refs/tags/${_pkgpfx}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('d624371dd455c66a300344c89812598ffe11b5eedba555779f789e85c29dc67317741858c60e0744a1e6755cc0d2759b8659f0674f4cc31479c4cb6fc25ed23b')

build() {
  cmake -B build -S ${_pkg}-${_pkgpfx}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-${_pkgpfx}-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
