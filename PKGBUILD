# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtdev
pkgver=1.1.6
pkgrel=2
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=(x86_64 aarch64)
url="https://bitmath.org/code/mtdev/"
license=('custom:MIT')
source=("$url$pkgname-$pkgver.tar.bz2")
makedepends=(autoconf)
sha256sums=('SKIP')

build()
{
  cd "$pkgname-$pkgver"
  autoreconf -fiv
  ./configure --prefix=/usr --disable-static --build=${CARCH}-unknown-linux-musl
  make
}

package()
{
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

