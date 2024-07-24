# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yaft
pkgver=0.2.9.r41.g59ef091
pkgrel=2
pkgdesc="yet another framebuffer terminal"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/uobikiemukot/yaft"
license=('MIT')
makedepends=('ncurses' 'linux-headers' 'git')
optdepends=('fbv: for the yaft_wall command to work'
            'idump: for the yaft_wall command to work')
_commit="59ef091187736200e07ee1d67d6249ad4c691542"
source=(
  git+$url.git#commit=$_commit
  yaft_wall
  font.bdf::https://github.com/olikraus/u8g2/raw/master/tools/font/bdf/spleen-12x24.bdf
)
backup=(usr/share/terminfo/y/yaft-256color)
sha256sums=('SKIP'
            '417cd162ab10cba41751a79cc52ae31dc394dfb268094a14750db34ee36f857a'
            '92e29053f4433e39ba582ac617694e6d94e6384eeeee83f588a38d2b6cc5914e')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$pkgname
  cp $srcdir/yaft_wall yaft_wall
  cp $srcdir/font.bdf fonts/
  sed -i 's@./mkfont_bdf .*@./mkfont_bdf table/alias fonts/font.bdf > glyph.h@' makefile
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR=$pkgdir install
}
