# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pamixer
pkgver=1.6
pkgrel=1
pkgdesc='Pulseaudio command-line mixer like amixer'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/cdemoulins/pamixer'
license=(GPL-3.0-or-later)
depends=(libpulse)
makedepends=(meson ninja cxxopts)
source=("pamixer-$pkgver.tar.gz::https://github.com/cdemoulins/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8b7199e495dc19b190f8f02ace8782f533266a4bd7c7d3cf6f4cf09b2de13e71')

build() {
  cd "pamixer-$pkgver"
  ewe-meson build
  ninja -C build
}

check() {
  cd "$pkgname-$pkgver"
  meson test -C build --print-errorlogs
}

package() {
  cd "pamixer-$pkgver"
  meson install -C build --destdir="$pkgdir"
}
