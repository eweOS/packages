# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssl
pkgver=1.1.1s
pkgrel=1
pkgdesc='A toolkit for the TLS and SSL protocols'
arch=(x86_64 aarch64)
url='https://www.openssl.org'
license=(BSD)
depends=(musl)
makedepends=(perl zlib)

source=(
  "https://www.openssl.org/source/openssl-${pkgver}.tar.gz"
)
sha256sums=(
  'SKIP'
)

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  ./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
    shared linux-${CARCH} \
    "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"
  make HOSTCC=clang CC=clang depend
  make HOSTCC=clang CC=clang
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"
  make HOSTCC=clang CC=clang DESTDIR="$pkgdir" MANDIR=/usr/share/man MANSUFFIX=ssl install_sw install_ssldirs install_man_docs
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
