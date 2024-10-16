# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gnome-sound-recorder
pkgver=42.0
pkgrel=1
pkgdesc="A utility to make simple audio recording from your GNOME desktop"
url="https://wiki.gnome.org/Apps/SoundRecorder"
arch=(any)
license=(GPL)
depends=(
  gjs
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gtk4
  libadwaita
)
makedepends=(
  git
  gobject-introspection
  meson
  gstreamer-devel
)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/gnome-sound-recorder.git#tag=$pkgver")
sha256sums=('5a38c81827c76b4a4589454a1f6b27ae98c31a1c37637b89d7d966488b4367af')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
