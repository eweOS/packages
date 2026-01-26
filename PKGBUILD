# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vid.stab
pkgver=1.1.1
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
sha256sums=('be0c62854938b275d49192135e71a84d84cb346440947837ba15e2e82d4bfee3')

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
