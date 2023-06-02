# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssl
pkgver=1.1.1s
pkgrel=2
pkgdesc='A toolkit for the TLS and SSL protocols'
arch=(x86_64 aarch64 riscv64)
url='https://www.openssl.org'
license=(BSD)
depends=(musl)
makedepends=(perl zlib)

source=(
  "https://www.openssl.org/source/openssl-${pkgver}.tar.gz"
)
sha256sums=('c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa')

build()
{
  case $CARCH in
    x86_64)
      export build_arch=linux-x86_64
      ;;
    aarch64)
      export build_arch=linux-arm64
      ;;
    riscv64)
      export build_arch=linux64-riscv64
      ;;
  esac
  cd "$srcdir/$pkgname-$pkgver"
  ./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib \
    shared ${build_arch} \
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
