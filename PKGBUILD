# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knewstuff
pkgver=6.17.0
pkgrel=1
pkgdesc='Support for downloading application assets from the network'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(attica
         karchive
         kconfig
         kcoreaddons
         ki18n
         kpackage
         kwidgetsaddons
         qt6-base
         syndication)
makedepends=(extra-cmake-modules
             kirigami
             qt6-declarative
             qt6-tools)
optdepends=('kirigami: QML components'
            'qt6-declarative: QML components')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1059cb7cdb9ba8170de82a08c6833490007a152a46e4bdbe24304eeddc263d66')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
