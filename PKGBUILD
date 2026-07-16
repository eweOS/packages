# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libmicrohttpd
pkgver=1.0.6
pkgrel=1
pkgdesc='a small C library that is supposed to make it easy to run an HTTP server as part of another application.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.gnu.org/software/libmicrohttpd/'
license=('LGPL')
depends=('musl')
checkdepends=('curl')
provides=('libmicrohttpd.so')
source=("https://ftp.gnu.org/gnu/libmicrohttpd/$pkgname-$pkgver.tar.gz")
sha256sums=('bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70')

build()
{
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --disable-dependency-tracking \
    --disable-examples \
    --disable-heavy-tests \
    --disable-nls \
    --enable-curl \
    --enable-largefile \
    --enable-messages \
    --with-pic

  # --enable-https needs gnutls
  make
}

check()
{
  cd ${pkgname}-${pkgver}

  make check
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" install
  find $pkgdir -name "*.png" -delete
}
