# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=14.3
pkgrel=1
pkgdesc="Matrix group messaging app"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://gitlab.gnome.org/World/fractal"
license=(GPL-3.0-or-later)
depends=(
  dconf
  gdk-pixbuf2
  glib2
  glycin
  glycin-gtk4
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
  blueprint-compiler
  cmake
  meson
  rust
  xdg-desktop-portal
  gstreamer-devel
  grass
  libwebp
  mimalloc
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('646b9a43f41554ddfdc0bc17be3bcda3cae15f8238e53ff0aaea46483b90f14424433b10c79cf81d6911fca1251f7ea013a1da5ee55cd63881530d02256135a7')

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
  # TODO: fix rustc OOM (workaround with mimalloc)
  (
    export LD_PRELOAD=/usr/lib/libmimalloc.so
    meson compile -C build
  )
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  # NOTE: explicitly prevent rebuild: https://gitlab.gnome.org/GNOME/fractal/-/issues/1327
  meson install -C build --destdir "$pkgdir" --no-rebuild
}
