# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wlopm
pkgver=1.0.0
pkgrel=1
pkgdesc='Wayland output power management.'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://sr.ht/~leon_plickat/wlopm'
license=('GPL3')
depends=('wayland' 'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~leon_plickat/$pkgname/archive/v$pkgver.tar.gz" strict-prototype.patch)
sha256sums=('15f31bbd855131943397dded3a26003f2f5056e4c6a1a93d35ff7697b3f1e439'
            '7f4160f520308fa2f148dcd7d3e25a7a9cea535931f366e18f2feafe578bed82')

prepare() {
  _patch_ "$pkgname-v$pkgver"
}

build() {
  cd "$pkgname-v$pkgver"
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make DESTDIR="$pkgdir/" PREFIX='/usr' install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
