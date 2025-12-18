# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=openexr
pkgver=3.4.4
pkgrel=1
pkgdesc='A high dynamic-range image file format library'
url='https://www.openexr.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs imath libdeflate openjph)
makedepends=(cmake)
source=(https://github.com/openexr/openexr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('7c663c3c41da9354b5af277bc2fd1d2360788050b4e0751a32bcd50e8abaef8f')

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
