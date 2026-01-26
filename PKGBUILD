# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qqc2-breeze-style
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Applications useful for Plasma development'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kcolorscheme
         kconfig
         kguiaddons
         kiconthemes
         kirigami
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('1ce7b641570f7111d751b54400e80832e0c3122d3cb6a4c2a01b16c2ed71b5af')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
