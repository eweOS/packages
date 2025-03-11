# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=10.1
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
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('93793a9d6e6f8999a488655ee0b6dbad7b96e1eef33801dc0b0d885afe1820baf35e97c2e0fed6ca46ad119bfa86a8e56435fa7daf3d03c0734409c56a3618c7')

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
