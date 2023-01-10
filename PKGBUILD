# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=minizip
pkgver=1.2.12
pkgrel=2
arch=(x86_64 aarch64)
license=('custom')
pkgdesc="Mini zip and unzip based on zlib"
url="https://www.zlib.net/"
depends=('musl' 'zlib')
source=("https://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
  cd "${srcdir}/zlib-$pkgver"/contrib/minizip
  cp Makefile Makefile.orig
  cp ../README.contrib readme.txt
  autoreconf --install
  ./configure --prefix=/usr --enable-static=no
  make
}

package_minizip()
{
  cd "${srcdir}/zlib-$pkgver/contrib/minizip"
  make install DESTDIR="${pkgdir}"
  grep -A 24 '^  Copyright' ../../zlib.h > LICENSE
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/minizip/LICENSE

  # https://github.com/madler/zlib/pull/229
  rm "${pkgdir}/usr/include/minizip/crypt.h"
}
