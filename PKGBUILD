# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.14.1
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=(musl llvm-libs pixman)
makedepends=('git' 'cmake' 'googletest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e8cfb093d8124de1e63d3635b7d749758d0919c2e1b3ce44462ef7ab003060c4')

build() {
  cmake \
    --no-warn-unused-cli \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S "${pkgname}-${pkgver}" \
    -B build
  cmake --build ./build --config Release --target all
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}-${pkgver}"/LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
