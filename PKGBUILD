# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=readline
pkgver=8.2
pkgrel=1
pkgdesc='GNU readline library'
arch=('x86_64' 'aarch64')
license=('GPL')
depends=('musl' 'ncurses')
options=('!emptydirs' 'debug')

PURGE_TARGETS+=(usr/share/info/* usr/share/readline/*)

source=(
  "http://ftp.gnu.org/gnu/readline/readline-${pkgver}.tar.gz"
  inputrc
)

sha256sums=(
  'SKIP'
  'SKIP'
)

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make SHLIB_LIBS=-lncurses
}

package()
{
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
  install -Dm644 inputrc "$pkgdir"/etc/inputrc
}
