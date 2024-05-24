# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spice-protocol
pkgver=0.14.4
pkgrel=1
pkgdesc="Headers for SPICE protocol"
arch=(any)
url="https://spice-space.org"
license=('BSD' 'LGPL2.1')
makedepends=('meson')
source=(https://gitlab.freedesktop.org/spice/spice-protocol/-/archive/v$pkgver/spice-protocol-v$pkgver.tar.gz)
sha256sums=('9c31fa533ad531d1b816ffd0c24b4785d133e7bb397f72d35f7a6d59bcd7d53a')

build() {
  mkdir build
  cd "$srcdir/$pkgname-v$pkgver"
  ewe-meson ../build
  ninja -v -C ../build
}

package() {
  cd "$srcdir/$pkgname-v$pkgver"
  DESTDIR="$pkgdir/" ninja -C ../build install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
