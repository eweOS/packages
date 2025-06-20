# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wlopm
pkgver=1.0.0
pkgrel=1
pkgdesc='Wayland output power management.'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url='https://sr.ht/~leon_plickat/wlopm'
license=('GPL-3.0-only')
depends=('wayland' 'wayland-protocols')
# 0001: Backport, fix ENOENT errors when installing bash completion
#	https://git.sr.ht/~leon_plickat/wlopm/commit/41bc6618376cb2a87b154612e0b132761d4f4bd3
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~leon_plickat/$pkgname/archive/v$pkgver.tar.gz"
	"0001-Fix-bash-completion-installation.patch")
sha256sums=('15f31bbd855131943397dded3a26003f2f5056e4c6a1a93d35ff7697b3f1e439'
            '194e9bd5fdfac88926fb0aad6467e5e83920056e6d7d7d412457383a712352f5')

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
