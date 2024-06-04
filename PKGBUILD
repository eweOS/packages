# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=physfs
pkgver=3.2.0
pkgrel=1
pkgdesc='Portable and flexible I/O abstraction for archives'
arch=(x86_64 aarch64 riscv64)
url='https://icculus.org/physfs'
license=(ZLIB)
makedepends=(cmake git ninja)
source=("git+https://github.com/icculus/physfs#tag=release-$pkgver")
sha256sums=('SKIP')

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D PHYSFS_BUILD_TEST=OFF \
    -G Ninja \
    -S $pkgname
  ninja -C build all
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -D -m644 $pkgname/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
