# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seatd
pkgver=0.8.0
pkgrel=1
pkgdesc="A minimal seat management daemon, and a universal seat management library"
arch=(x86_64 aarch64 riscv64)
url="https://sr.ht/~kennylevinsen/seatd/"
license=('MIT')
makedepends=('meson' 'ninja' 'scdoc')
source=(
  "$pkgname-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/$pkgname/archive/$pkgver.tar.gz"
  seatd.service
  seatd.sysusers
)
sha256sums=('a562a44ee33ccb20954a1c1ec9a90ecb2db7a07ad6b18d0ac904328efbcf65a0'
            '1233ba7fea415e9c35932441c24b6a26b2b30ba0e593808e704c05eded8ea54d'
            'e833292adf5da25b5258a5209c258f0e4c12e1d6fe81cf228fd0cfb575080d78')

build()
{
  CFLAGS="${CFLAGS} -Wno-sign-compare" \
    ewe-meson $pkgname-$pkgver build \
    -D libseat-logind=disabled \
    -D examples="disabled"
  ninja -C build
}

check()
{
  ninja -C build test
}

package()
{
  DESTDIR="$pkgdir/" meson install -C build
  install -D $srcdir/seatd.service $pkgdir/etc/dinit.d/seatd
  install -D $srcdir/seatd.sysusers $pkgdir/usr/lib/sysusers.d/seatd.conf
  install -D "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
