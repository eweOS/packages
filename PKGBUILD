# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seatd
pkgver=0.8.0
pkgrel=2
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
            '822088c07de1354b067838501721a1da6fe01887984e15e842ad36687984334e'
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
  _dinit_install_services_ $srcdir/seatd.service
  _install_sysusers_ $srcdir/seatd.sysusers
  _install_license_ $srcdir/$pkgname-$pkgver/LICENSE
}
