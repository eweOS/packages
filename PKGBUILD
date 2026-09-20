# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.1.3
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(musl llvm-libs)
makedepends=(git cmake)
provides=(libde265.so)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('15b35cc5ed154a31bd825bb22d033d9bb93663d1f85ba971ff04b41a239c99a3')

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
