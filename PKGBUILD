# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vid.stab
pkgver=1.1.2
pkgrel=1
pkgdesc='Video stabilization library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=http://public.hronopik.de/vid.stab
license=(GPL)
depends=(
  llvm-libs
  musl
)
makedepends=(
  cmake
  git
  ninja
)
provides=(libvidstab.so)
source=(git+https://github.com/georgmartius/vid.stab.git#tag=v$pkgver)
sha256sums=('5574d82826b84157243dbfb7cd9dec654ad3b8edd00bf1a7eee0bd611613c488')

build() {
  cmake -S vid.stab -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
