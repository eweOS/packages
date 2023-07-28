# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seatd
pkgver=0.7.0
pkgrel=2
pkgdesc="A minimal seat management daemon, and a universal seat management library"
arch=(x86_64 aarch64 riscv64)
url="https://sr.ht/~kennylevinsen/seatd/"
license=('MIT')
makedepends=('meson' 'ninja')
source=(
  "$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/$pkgname/archive/$pkgver.tar.gz"
  seatd.service
  seatd.sysusers
)
sha256sums=('210ddf8efa1149cde4dd35908bef8e9e63c2edaa0cdb5435f2e6db277fafff3c'
            '1233ba7fea415e9c35932441c24b6a26b2b30ba0e593808e704c05eded8ea54d'
            'e833292adf5da25b5258a5209c258f0e4c12e1d6fe81cf228fd0cfb575080d78')

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
  install -D $srcdir/seatd.sysusers $pkgdir/usr/lib/sysusers.d/seatd.conf
  install -D "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
