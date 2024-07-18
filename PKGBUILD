# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yaft
pkgver=0.2.9
pkgrel=2
pkgdesc="yet another framebuffer terminal"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/uobikiemukot/yaft"
license=('MIT')
makedepends=('ncurses' 'linux-headers')
optdepends=('fbv: for the yaft_wall command to work'
            'idump: for the yaft_wall command to work')
source=(
  $url/archive/v$pkgver.tar.gz
  yaft_wall
  font.bdf::https://github.com/olikraus/u8g2/raw/master/tools/font/bdf/spleen-12x24.bdf
)
backup=(usr/share/terminfo/y/yaft-256color)
sha256sums=('80f7e6937ff0a34f77859c684d6f8e23c55d696e0bac4ac8b2f11f785db0374c'
            '6748cf906e79128c1973847ef6a55bf8316018959ecea0540de8b2810840a8bb'
            '92e29053f4433e39ba582ac617694e6d94e6384eeeee83f588a38d2b6cc5914e')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/yaft_wall yaft_wall
  cp $srcdir/font.bdf fonts/
  sed -i 's@./mkfont_bdf .*@./mkfont_bdf table/alias fonts/font.bdf > glyph.h@' makefile
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
