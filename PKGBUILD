# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waycheck
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple GUI that displays the protocols implemented by a Wayland compositor"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.freedesktop.org/serebit/$pkgname"
license=("Apache-2.0")
depends=("hicolor-icon-theme" "qt6-base" "qt6-wayland" "wayland")
makedepends=("meson")
checkdepends=("appstream")
source=("$url/-/archive/v$pkgver/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('a7fadf5bc03dea027fc03453598b75799e422577d7b841dfd17b1e134ca60436')

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
