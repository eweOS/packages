# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seatd
pkgver=0.7.0
pkgrel=1
pkgdesc="A minimal seat management daemon, and a universal seat management library"
arch=(x86_64 aarch64)
url="https://sr.ht/~kennylevinsen/seatd/"
license=('MIT')
makedepends=('meson' 'ninja')
source=(
  "$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/$pkgname/archive/$pkgver.tar.gz"
  seatd.service
)
sha256sums=('SKIP' 'SKIP')

build()
{
  CFLAGS="${CFLAGS} -Wno-sign-compare" \
    ewe-meson $pkgname-$pkgver build \
    -D libseat-logind=disabled \
    -D man-pages=disabled
  ninja -C build
}

package()
{
  DESTDIR="$pkgdir/" meson install -C build
  install -D $srcdir/seatd.service $pkgdir/etc/dinit.d/seatd
  install -D "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
