# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-recorder
pkgver=0.6.0
pkgrel=3
pkgdesc="Screen recorder for wlroots-based compositors such as sway"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/ammen99/wf-recorder"
license=('MIT')
depends=(
  'ffmpeg'
  'libpulse'
  'pipewire'
  'wayland'
)
makedepends=(
  'meson'
  'wayland-protocols'
  'linux-headers'
)
optdepends=(
  'slurp: Select a region to record'
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/ammen99/wf-recorder/archive/v$pkgver.tar.gz"
)
sha256sums=('52d2c952506d63708f9a8f1aacd4d6ca176287caf3507c8ff2882fa0390cb391')

build() {
  ewe-meson -Dpulse=enabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
