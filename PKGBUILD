# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssl
pkgver=4.1.0
pkgrel=1
pkgdesc='A toolkit for the TLS and SSL protocols'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.openssl.org'
license=(Apache-2.0)
makedepends=(perl zlib linux-headers)
source=("https://github.com/openssl/openssl/releases/download/openssl-$pkgver/openssl-$pkgver.tar.gz"
	"0001-Fix-out-of-bounds-read-of-suiteb_curves.patch")
sha256sums=('50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd'
            'e847c8b84d3dd07bc9f5abc7232e08d92cdf7322455ed73c6403d4aa5556a7f2')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build()
{
  case $CARCH in
    x86_64)
      export build_arch=linux-x86_64
      ;;
    aarch64)
      export build_arch=linux-aarch64
      ;;
    riscv64)
      export build_arch=linux64-riscv64
      ;;
    loongarch64)
      export build_arch=linux64-loongarch64
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
  install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
