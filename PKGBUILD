# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=12.1
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
  mimalloc
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('93739acdeabbf4ec6c3d9abd2fb4ee2ec7f01faf69aa58c73c89ed7fd801cdd308b623a7e9bde1106df77c95cbb8c9b6461bfd5fdc7ef4bc4e2fdad48490ac49')

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
