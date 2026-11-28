# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.14.4
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=(musl llvm-libs pixman)
makedepends=('git' 'cmake' 'googletest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8097938eee51ef82db73ff884f5b0780c251ef1a3c3ea28da0c19d2408013db')

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
