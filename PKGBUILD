# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.1.3
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
makedepends=('git' 'cmake' 'make')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f84654af9b2efe5be478821e837b1975298292558c4569bd35e065e356a69c7')

build() {
  cd "${pkgname}-${pkgver}"
  cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
  cmake --build ./build --config Release --target all
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
