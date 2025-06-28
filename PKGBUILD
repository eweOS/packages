# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waycheck
pkgver=1.7.0
pkgrel=1
pkgdesc="Simple GUI that displays the protocols implemented by a Wayland compositor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.freedesktop.org/serebit/$pkgname"
license=("Apache-2.0")
depends=("hicolor-icon-theme" "qt6-base" "qt6-wayland" "wayland")
makedepends=("meson")
checkdepends=("appstream")
source=("$url/-/archive/v$pkgver/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('004ac5ec08e9aba19fe11e82b6c64e124a0c729e25798847865d35c503032a19')

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
