# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=double-conversion
pkgver=3.3.1
pkgrel=1
pkgdesc='Binary-decimal and decimal-binary routines for IEEE doubles'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/google/double-conversion'
license=(BSD-3-Clause)
depends=(llvm-libs musl)
makedepends=(cmake
             git)
source=(git+https://github.com/google/double-conversion#tag=v$pkgver)
sha256sums=('6009d129b305b65819cf37cd8cd8f07557a461d141a91f6e3afd553c4a384d59')

prepare() {
# Fix build with cmake 4
  git -C $pkgname cherry-pick -n 101e1ba89dc41ceb75090831da97c43a76cd2906
}

build() {
  cmake -B build -S $pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package () {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
