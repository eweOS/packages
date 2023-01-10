# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Roman G <drakosha@au.ru>

pkgname=axel
pkgver=2.17.11
pkgrel=1
pkgdesc="Light command line download accelerator"
arch=(x86_64 aarch64)
url="https://github.com/axel-download-accelerator/axel"
license=('GPL')
depends=('musl' 'openssl')
source=(https://github.com/axel-download-accelerator/axel/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
sha256sums=('SKIP')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
