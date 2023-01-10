# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=http-parser
pkgver=2.9.4
pkgrel=1
pkgdesc="Parser for HTTP Request/Response written in C"
arch=(x86_64 aarch64)
url="https://github.com/nodejs/http-parser"
license=('MIT')
depends=('musl')
source=($pkgname-$pkgver.tar.gz::"${url}/archive/v$pkgver.tar.gz")
sha512sums=('SKIP')

prepare()
{
  sed -i 's|-Werror||' $pkgname-$pkgver/Makefile
}

build()
{
  cd $pkgname-$pkgver
  make library
}

check()
{
  cd $pkgname-$pkgver
  make test
}

package()
{
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE-MIT -t "$pkgdir"/usr/share/licenses/$pkgname/
}
