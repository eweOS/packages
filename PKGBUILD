# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=netease-cloud-music-gtk
pkgver=2.5.2
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
sha256sums=('890aa1fa4d919268d1645bd88791ab9587ae1f55854b8c92410d1c33a99e1b2b')

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
