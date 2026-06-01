# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.1.0
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(musl llvm-libs)
makedepends=(git cmake)
provides=(libde265.so)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('f1f2b3b4ed36d2a3817a4cf32a4ad42f97b72520bbf0e64ebcef40f3beff5e9a')

build() {
  cmake -S $pkgname -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DECODER=ON \
    -DENABLE_ENCODER=ON \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
