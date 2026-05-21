# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.0.18
pkgrel=2
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
depends=(musl llvm-libs)
makedepends=(git cmake)
provides=(libde265.so)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('4794e574bde26e8e1dbe7e08bc1176e714056ba134e0987e2cc84d9a882b6e15')

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
