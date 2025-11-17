# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qqc2-desktop-style
pkgver=6.20.0
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcolorscheme
         kconfig
         kiconthemes
         kirigami
         qt6-base
         qt6-declarative
         sonnet)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('0f9d15ff0dd3b9744563360860cbb1e137b1d9b89376210e7328aaa02ed4ab7e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

