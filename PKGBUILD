# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=11.2
pkgrel=1
pkgdesc="Matrix group messaging app"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  libseccomp
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
  grass
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('5286952afca12f6a76345a486bfc9862ad64d893a9fad79ff545958222656052db46f2af33172ae6debf37d8445f9bd24fcd62c7c4dfb03e88a59f9dec7b2b25')

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
