# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openexr
pkgver=3.4.3
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(imath libdeflate)
makedepends=(cmake)
source=(https://github.com/openexr/openexr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('06494da42eb91c47265ffbad02d0c73cf65d8ad7f24683b801f34d842c4ecb6d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
