# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ministream
pkgver=0.99.1
pkgrel=1
pkgdesc="Provides a small AppStream metadata parser for libadwaita"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.gnome.org/GNOME/ministream"
license=(LGPL-2.1-or-later)
depends=(glib)
makedepends=(
  gobject-introspection
  meson
)
source=("https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('4c863b588fa9a1f8e0bb46a4357cac5737682d82d09229715689145fc34aad83')

build() {
  local meson_options=(
    # Internal validation tool, not installed.
    -D as-compare=disabled
  )
  ewe-meson "$pkgname-$pkgver" build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  _install_license_ "$srcdir/$pkgname-$pkgver/COPYING"
}
