# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Thomas S Hatch <thatch45 at gmail dot com>

pkgname=libaio
pkgver=0.3.113
pkgrel=2
pkgdesc="The Linux-native asynchronous I/O facility (aio) library"
arch=(x86_64 aarch64)
url="https://pagure.io/libaio"
license=(LGPL2.1)
depends=(musl)
provides=(libaio.so)
source=(https://pagure.io/libaio/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.gz)
sha512sums=('SKIP')

prepare()
{
  # -Werror, not even once
  sed 's/-Werror//' -i $pkgname-$pkgname-$pkgver/harness/Makefile
}

build()
{
  # libaio is a thin wrapper around kernel syscalls, it does not use stdlib and
  # other helpers like stack protection libraries
  case "${CARCH}" in
    x86_64)  MARCH="x86-64" ;;
    aarch64) MARCH="armv8-a" ;;
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

