# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdeflate
pkgver=1.26
pkgrel=1
pkgdesc='Heavily optimized library for DEFLATE/zlib/gzip compression and decompression'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/ebiggers/libdeflate
license=(MIT)
makedepends=(
  cmake
  git
  ninja
)
provides=(libdeflate.so)
source=(git+https://github.com/ebiggers/libdeflate.git#tag=v$pkgver)
sha256sums=('38a3ffe3a56fba0e95138a5f57a764ffd5632c49dcd6a3515536f8a1ee907a9d')

build() {
  cmake -S libdeflate -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDEFLATE_BUILD_STATIC_LIB=OFF \
    -DLIBDEFLATE_BUILD_TESTS=ON
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 libdeflate/COPYING -t "${pkgdir}"/usr/share/licenses/libdeflate/
}
