# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mtdev
pkgver=1.1.6
pkgrel=3
pkgdesc="A stand-alone library which transforms all variants of kernel MT events to the slotted type B protocol"
arch=(x86_64 aarch64)
url="https://bitmath.org/code/mtdev/"
license=('custom:MIT')
source=("$url$pkgname-$pkgver.tar.bz2")
makedepends=(autoconf)
sha256sums=('15d7b28da8ac71d8bc8c9287c2045fd174267bc740bec10cfda332dc1204e0e0')

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

