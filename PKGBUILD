# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.12.0
pkgrel=2
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=(musl llvm-libs pixman)
makedepends=('git' 'cmake' 'googletest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d9b495cc8c7602fe54148388fe94892a1337be871267dc5e93f4e719fe6ef8f2')

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
