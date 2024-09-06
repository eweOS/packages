# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minizip-ng
pkgver=4.0.7
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/zlib-ng/minizip-ng'
license=(Zlib)
depends=(bzip2
         openssl
         xz
         zlib
         zstd)
makedepends=(cmake
             git)
provides=(minizip)
conflicts=(minizip)
replaces=(minizip)
source=(git+https://github.com/zlib-ng/minizip-ng#tag=$pkgver)
sha256sums=('f4c388042d4911e625f02ac6a7bef0bf5b2fca2227c6ed7ec64c65ade98e33d0')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
