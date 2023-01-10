# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=unibilium
pkgver=2.1.1
pkgrel=1
pkgdesc='A terminfo parsing library'
arch=(x86_64 aarch64)
url='https://github.com/neovim/unibilium'
depends=('musl')
provides=('libunibilium.so')
license=('LGPL3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/neovim/unibilium/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

build()
{
  cd $pkgname-$pkgver
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
