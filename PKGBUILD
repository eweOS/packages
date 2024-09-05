# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-recorder
pkgver=0.5.0
pkgrel=1
pkgdesc="Screen recorder for wlroots-based compositors such as sway"
arch=("x86_64" "aarch64" "riscv64")
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/ammen99/wf-recorder/archive/v$pkgver.tar.gz")
sha256sums=('b9168bfdf41995bce2cfed5487e3ca8f2e75a5661b92cebea086a3468d20d87c')

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
