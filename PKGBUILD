# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=8
pkgrel=1
pkgdesc="Matrix group messaging app"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.gnome.org/World/fractal"
license=(GPL-3.0-only)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  graphene
  gst-plugins-bad
  gst-plugins-base
  gstreamer
  gtk4
  gtksourceview5
  hicolor-icon-theme
  libadwaita
  pipewire
  libshumate
  openssl
  pango
  sqlite
)
makedepends=(
  cmake
  meson
  rust
  xdg-desktop-portal
  gstreamer-devel
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('6a77843ff0fd3171ed674de59d074df04de335310a0c4aff96da04860bf003c76b12fb424e75af69deb6bd0a4770867e4c9cdba9191c7646cfa183b06bde4faf')

prepare() {
  # NOTE: usptream uses a custom CARGO_HOME from within meson
  export CARGO_HOME="$(pwd)/build/cargo-home"
  cd $pkgname-$pkgver
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  export CARGO_PROFILE_RELEASE_LTO=off
  ewe-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  # NOTE: explicitly prevent rebuild: https://gitlab.gnome.org/GNOME/fractal/-/issues/1327
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
