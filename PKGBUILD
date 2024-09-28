# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=unibilium
pkgver=2.1.2
pkgrel=1
pkgdesc='A terminfo parsing library'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/neovim/unibilium'
depends=('musl')
makedepends=('autoconf')
provides=('libunibilium.so')
license=('LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/unibilium/archive/v$pkgver.tar.gz")
sha512sums=('8bc50b3662fcb1b52055fed028926d8c296169b6b1cfefef9bb37a435321ee6e005c4166c1e68c2959e5f6d4ffe8f44d8ea87d6dcc967176d473ae918ff3018f')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make PREFIX=/usr
}

check()
{
  cd $pkgname-$pkgver
  make test
}

package()
{
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" make install PREFIX=/usr
}
