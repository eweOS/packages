# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.2.1
pkgrel=2
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=(x86_64 aarch64)
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lipnitsk/libcue/archive/v$pkgver.tar.gz")
depends=('musl')
makedepends=('cmake' 'bison' 'flex')
sha512sums=('SKIP')

build()
{
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_SHARED_LIBS=ON .
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
