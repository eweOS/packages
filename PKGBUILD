# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=readline
pkgver=8.2
pkgrel=2
pkgdesc='GNU readline library'
arch=(x86_64 aarch64 riscv64)
license=('GPL')
depends=('musl' 'ncurses')
options=('!emptydirs')

PURGE_TARGETS+=(usr/share/info/* usr/share/readline/*)

source=(
  "http://ftp.gnu.org/gnu/readline/readline-${pkgver}.tar.gz"
  inputrc
)

sha256sums=('3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35'
            '36e9611f935ee108d161587b0615f9c390192ef4bbff6dc59b58671261029901')

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
