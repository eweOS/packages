# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sl
pkgver=5.05
pkgrel=1
pkgdesc='Steam Locomotive runs across your terminal when you type "sl" as you meant to type "ls"'
arch=(x86_64 aarch64)
url="https://github.com/eyJhb/sl"
license=('custom')
depends=('ncurses')
source=("https://github.com/eyJhb/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('SKIP')

prepare()
{
  cd $pkgname-$pkgver
  sed -i s/gcc/cc/g Makefile
}

build()
{
  cd $pkgname-$pkgver
  make
  gzip -9 -f sl.1
}

package()
{
  cd $pkgname-$pkgver
  install -Dm 775 sl $pkgdir/usr/bin/sl
  install -Dm 644 sl.1.gz $pkgdir/usr/share/man/man1/sl.1.gz
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
