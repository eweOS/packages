# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fractal
pkgver=13
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
  blueprint-compiler
)
options=(!lto)
optdepends=('org.freedesktop.secrets: password storage')
source=(
  $url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz
)
sha512sums=('c89bf10767a84f303a4280ba5856c7e0319f21ee6b3eb64bf808d5dd1a9372cdac01a70a11253f2856b28fd3cd67c746a3e8e79b51272e976ef7b3a335bd790f')

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
