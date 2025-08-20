# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qqc2-breeze-style
pkgver=6.4.4
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
sha256sums=('fb73e858d079f0a292ed571558f2cd25ef7e83cbecd15f62f5789540c3b0951c')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
