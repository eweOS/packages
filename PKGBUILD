# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waycheck
pkgver=1.4.0
pkgrel=1
pkgdesc="Simple GUI that displays the protocols implemented by a Wayland compositor"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.freedesktop.org/serebit/$pkgname"
license=("Apache-2.0")
depends=("hicolor-icon-theme" "qt6-base" "qt6-wayland" "wayland")
makedepends=("meson")
checkdepends=("appstream")
source=("$url/-/archive/v$pkgver/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('8203bb8bbe2ccc7348e3e53764e4cd906f0dd862f2fa955ef945983da9e83994')

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
