# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waycheck
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple GUI that displays the protocols implemented by a Wayland compositor"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.freedesktop.org/serebit/$pkgname"
license=("Apache-2.0")
depends=("hicolor-icon-theme" "qt6-base" "qt6-wayland" "wayland")
makedepends=("meson")
checkdepends=("appstream")
source=("$url/-/archive/v$pkgver/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('5e319fdbddd9e039bc5b1b3a4474f1a7e3fd0417154b86adf879fd38fd3d1dd1')

build() {
  ewe-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
