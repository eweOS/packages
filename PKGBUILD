# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minizip-ng
pkgver=4.2.2
pkgrel=1
pkgdesc='Fork of the popular zip manipulation library found in the zlib distribution'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('3564e2aa171fb6556607d5c08c753c78e488c8e9342c166901f445f5415ed05b')

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
