# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtdev
pkgver=1.1.7
pkgrel=1
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=(x86_64 aarch64 riscv64)
url="https://bitmath.org/code/mtdev/"
license=('custom:MIT')
source=("$url$pkgname-$pkgver.tar.bz2")
provides=('libmtdev.so')
makedepends=(autoconf linux-headers)
sha256sums=('a107adad2101fecac54ac7f9f0e0a0dd155d954193da55c2340c97f2ff1d814e')

build()
{
  cd "$pkgname-$pkgver"
  autoreconf -fiv
  ./configure --prefix=/usr --disable-static --build=${CARCH}-unknown-linux-musl
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

