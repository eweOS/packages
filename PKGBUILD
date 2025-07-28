# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openexr
pkgver=3.3.5
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(imath libdeflate)
makedepends=(cmake)
source=(https://github.com/openexr/openexr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('cb0c88710c906c9bfc59027eb147e780d508c7be1a90b43af3ec9e3c2987b70d')

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
