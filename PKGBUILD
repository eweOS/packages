# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: said <atvordhosbn[at]gmail[dot]com>

pkgname=libcue
pkgver=2.3.0
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=(x86_64 aarch64 riscv64)
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lipnitsk/libcue/archive/v$pkgver.tar.gz")
makedepends=('cmake' 'bison' 'flex')
sha512sums=('fe2c39cc9794ac36c0706405e0432bab23228d343ba4e3395220d5b2a2ebf8b3c97e71d76a628f9144977c0dd56636f78d0c2d1f9f2b0d4068a837a258f035b6')

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
