# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=netease-cloud-music-gtk
pkgver=2.5.4
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
sha256sums=('8ecb27148ad1e9e73695f08450c0e12598bb9180f42058af307a18b5a2c70e64')

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
