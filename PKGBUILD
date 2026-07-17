# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openssl
pkgver=3.6.3
pkgrel=1
pkgdesc='A toolkit for the TLS and SSL protocols'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.openssl.org'
license=(BSD)
makedepends=(perl zlib linux-headers)
source=("https://github.com/openssl/openssl/releases/download/openssl-$pkgver/openssl-$pkgver.tar.gz")
sha256sums=('243a86649cf6f23eeb6a2ff2456e09e5d77dd9018a54d3d96b0c6bdd6ba6c7f1')

prepare()
{
  # fix riscv hwprobe
  sed -i '1i #include <asm/unistd.h>' $pkgname-$pkgver/crypto/riscvcap.c
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
