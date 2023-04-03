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
sha512sums=('0f78a83ff4c70d93814e3c38a1785ede7301d16cbff52c61489ded06ffe69cfa14ba90ef6e3caa1776978ab035376079643cedf3311d4d9cd5f2b69088cc55ab')

build() {
  cmake -B build -S ${_pkg}-sdk-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr .
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkg}-sdk-${pkgver}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
