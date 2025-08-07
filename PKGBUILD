# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=readline
pkgver=8.3
pkgrel=2
pkgdesc='GNU readline library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL')
depends=('musl' 'ncurses')
options=('!emptydirs')
provides=('libhistory.so' 'libreadline.so')

PURGE_TARGETS+=(usr/share/info/* usr/share/readline/*)

# 0000-8.3.0-display-null-prompt-workaround.patch is from
# https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/commit/b30636dc66fc783a091af51b049dc5240f861dd0
source=(
  "http://ftp.gnu.org/gnu/readline/readline-${pkgver}.tar.gz"
  inputrc
  0000-8.3.0-display-null-prompt-workaround.patch
)

sha256sums=('fe5383204467828cd495ee8d1d3c037a7eba1389c22bc6a041f627976f9061cc'
            '36e9611f935ee108d161587b0615f9c390192ef4bbff6dc59b58671261029901'
            '9e7c483c6482dd441d89edeb9534d078f843130ef0ff2c98da7a75a06cd0e319')

prepare()
{
  _patch_ $pkgname-$pkgver
}

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
