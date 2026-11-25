# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=unibilium
pkgver=2.1.4
pkgrel=1
pkgdesc='A terminfo parsing library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/neovim/unibilium'
depends=('musl')
makedepends=('autoconf')
provides=('libunibilium.so')
license=('LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/unibilium/archive/v$pkgver.tar.gz")
sha512sums=('e1d351b7f4c13825c415f3b8078abd538863614a8aa443e3c5e5b85110372084ff4385c4b17eb7a546807188265285ca4b6493b6db9670d490f7743b89f11c4f')

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
