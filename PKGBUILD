# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=minizip-ng
pkgver=4.0.9
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
sha256sums=('11bfc06f2ca0091bf9508fd1efd8d6f4d6252e351886f179f733995e28435c3e')

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
