# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=spice-protocol
pkgver=0.14.5
pkgrel=1
pkgdesc="Headers for SPICE protocol"
arch=(any)
url="https://spice-space.org"
license=('BSD' 'LGPL2.1')
makedepends=('meson')
source=(https://gitlab.freedesktop.org/spice/spice-protocol/-/archive/v$pkgver/spice-protocol-v$pkgver.tar.gz)
sha256sums=('1be179b3dfbb23946432275f4b7a4b59bb5e9acc25c3128bc930b8264a9f0a20')

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
