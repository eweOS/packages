# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openexr
pkgver=3.4.5
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs imath libdeflate openjph)
makedepends=(cmake)
source=(https://github.com/openexr/openexr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('b10f21d3f8ff3211eb1687a2e2bf7a79d361aec8dfaca1f9b79f3d70755b4f48')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

# TODO: enable check
# Failed tests
#	OpenEXR.Iex
#	OpenEXRCore.testAttrStringVectors

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
