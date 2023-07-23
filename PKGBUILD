# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssl
pkgver=1.1.1u
pkgrel=1
pkgdesc='A toolkit for the TLS and SSL protocols'
arch=(x86_64 aarch64 riscv64)
url='https://www.openssl.org'
license=(BSD)
depends=(musl)
makedepends=(perl zlib)

source=(
  "https://www.openssl.org/source/openssl-${pkgver}.tar.gz"
)
sha256sums=('e2f8d84b523eecd06c7be7626830370300fbcc15386bf5142d72758f6963ebc6')

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
