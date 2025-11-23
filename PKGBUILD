# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprutils"
pkgver=0.10.2
pkgrel=1
pkgdesc="Hyprland utilities library used across the ecosystem"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprutils"
license=('BSD-3-Clause')
depends=(pixman)
makedepends=('git' 'cmake' 'googletest')
# 0001, backport cb3e797fde5c ("internal: fix missing headers (#86)")
#	add missing includes to fix build errors
#	https://github.com/hyprwm/hyprutils/commit/cb3e797fde5c748164eb70d9859336141136a166
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-internal-fix-missing-headers.patch")
sha256sums=('f468997ee10d2f38413f65e099f717a88c6b7c0a0aba64d2c663d5508dfb5439'
            '6feaa325f7abab93aea9736c2d7bfa78a3156d5afc1b3aaca24c688d9dba709f')

prepare() {
  _patch_ "${pkgname}-${pkgver}"
}

build() {
  cmake \
    --no-warn-unused-cli \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -S "${pkgname}-${pkgver}" \
    -B build
  cmake --build ./build --config Release --target all
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${pkgname}-${pkgver}"/LICENSE \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
