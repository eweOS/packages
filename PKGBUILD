# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdeflate
pkgver=1.21
pkgrel=1
pkgdesc='Heavily optimized library for DEFLATE/zlib/gzip compression and decompression'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/ebiggers/libdeflate
license=(MIT)
makedepends=(
  cmake
  git
  ninja
)
provides=(libdeflate.so)
source=(git+https://github.com/ebiggers/libdeflate.git#tag=v$pkgver)
sha256sums=('fd9fc1b74f9a0658b7fe4f1ee4608fe1008cb14e400eaca54e126ad7c823abc9')

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
