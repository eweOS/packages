# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libaio
pkgver=0.3.113
pkgrel=4
pkgdesc="The Linux-native asynchronous I/O facility (aio) library"
arch=(x86_64 aarch64 riscv64)
url="https://pagure.io/libaio"
license=(LGPL2.1)
depends=(musl)
makedepends=(linux-headers)
provides=(libaio.so)
source=(https://pagure.io/libaio/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.gz fix-riscv64-test.patch)
sha512sums=('8058c927de0b5f7079fc232d2be23272537694bf271488af1dc0330b58afc307931792ab138512c5e00aa3ea921935a6d862f575fb0cc2bf323de63d8df208cd'
            '6f75918c4eb93a50165c636239ca9ff509c557e0ae4392746e3aeaee84e11d854d0f8855da8acb746b2fd7937226cc1ef1b2b7ff3fbca7b1f5f8e3d6c262c2c0')

prepare()
{
  # -Werror, not even once
  sed 's/-Werror//' -i $pkgname-$pkgname-$pkgver/harness/Makefile
  _patch_ $pkgname-$pkgname-$pkgver
}

build()
{
  # libaio is a thin wrapper around kernel syscalls, it does not use stdlib and
  # other helpers like stack protection libraries
  case "${CARCH}" in
    x86_64)  MARCH="x86-64" ;;
    aarch64) MARCH="armv8-a" ;;
    riscv64) MARCH="rv64gc" ;;
  esac
  CFLAGS="-march=${MARCH} -mtune=generic -O2 -pipe"
  make -C $pkgname-$pkgname-$pkgver
}

check()
{
  make partcheck -k -C $pkgname-$pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgname-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname-$pkgname-$pkgver/man/*.3 -t "$pkgdir/usr/share/man/man3/"
}

