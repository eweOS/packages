# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=minizip
pkgver=1.3
pkgrel=1
arch=(x86_64 aarch64 riscv64)
license=('custom')
pkgdesc="Mini zip and unzip based on zlib"
url="https://www.zlib.net/"
depends=('musl' 'zlib')
source=("https://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e')

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
