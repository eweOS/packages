# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=oed
pkgver=7.1
pkgrel=1
pkgdesc="Portable version of the OpenBSD ed text editor"
arch=(x86_64 aarch64)
url="https://github.com/ibara/oed"
license=('BSD' 'ISC')
depends=('musl')
source=("https://github.com/ibara/oed/archive/refs/tags/oed-${pkgver}.tar.gz")
sha512sums=('40425091166ce950ebd7144c0c876d76f496d50c8abfcd1d7663b7933869cb92ea30e0ffec91de83b14d65d71c61b39d5d2818adb619bb88707831e303c5850b')

build()
{
  cd $pkgname-$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --program-name=$pkgname
  make
}

package()
{
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
