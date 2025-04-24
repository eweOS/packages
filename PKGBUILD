# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=netease-cloud-music-gtk
pkgver=2.5.1
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
sha256sums=('5fc5524e9057ce881e53f7668944f0997f05df8280ada532a2a9cf2c56ddc2a8')

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
