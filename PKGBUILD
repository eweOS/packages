# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.13.1
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=(musl llvm-libs pixman)
makedepends=('git' 'cmake' 'googletest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('480ee026105deea64a24eb96d80cabe54b357594ce36cb05c021ea226c69aede')

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
