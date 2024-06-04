# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yaft
pkgver=0.2.9
pkgrel=1
pkgdesc="yet another framebuffer terminal"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/uobikiemukot/yaft"
license=('MIT')
makedepends=('ncurses' 'linux-headers')
optdepends=('fbv: for the yaft_wall command to work'
            'idump: for the yaft_wall command to work')
source=($url/archive/v$pkgver.tar.gz)
backup=(usr/share/terminfo/y/yaft-256color)
sha256sums=('80f7e6937ff0a34f77859c684d6f8e23c55d696e0bac4ac8b2f11f785db0374c')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
