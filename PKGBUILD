# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=physfs
pkgver=3.2.0
pkgrel=2
pkgdesc='Portable and flexible I/O abstraction for archives'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://icculus.org/physfs'
license=(ZLIB)
makedepends=(cmake git ninja)
source=("git+https://github.com/icculus/physfs#tag=release-$pkgver")
sha256sums=('2a7313be69c0f381ec48b07fefbe32a987421504319f26c2ac0fcf22e510b714')

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
