# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libseat
pkgbase=seatd
pkgver=0.8.0
pkgrel=3
pkgdesc="A minimal seat management daemon, and a universal seat management library"
arch=(x86_64 aarch64 riscv64)
url="https://sr.ht/~kennylevinsen/seatd/"
license=('MIT')
depends=('elogind')
makedepends=('meson' 'ninja' 'scdoc')
provides=('seatd')
source=(
  "$pkgbase-$pkgver.tar.gz::https://git.sr.ht/~kennylevinsen/$pkgbase/archive/$pkgver.tar.gz"
)
sha256sums=('a562a44ee33ccb20954a1c1ec9a90ecb2db7a07ad6b18d0ac904328efbcf65a0')

build()
{
  CFLAGS="${CFLAGS} -Wno-sign-compare" \
    ewe-meson $pkgbase-$pkgver build \
    -D libseat-logind="elogind" \
    -D libseat-seatd="disabled" \
    -D server="disabled" \
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
  _install_license_ $srcdir/$pkgbase-$pkgver/LICENSE
}
