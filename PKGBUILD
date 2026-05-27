# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=netease-cloud-music-gtk
pkgver=2.5.3
pkgrel=1
pkgdesc="Rust + GTK-based NetEase Cloud Music Player for Linux"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL-3.0-or-later')
depends=(
  'libadwaita'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
)
options=(!lto)
makedepends=('cargo' 'meson' 'gstreamer-devel')
source=(
  "https://github.com/gmg137/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=('b6e9dea10cd5fbd125267f0cfb886c38b55f05e699b92551e1ca9f3ac56bad9c')

prepare() {
  cd "$pkgname-$pkgver"
  cargo update --precise 0.7.0 gettext-rs
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  ewe-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
