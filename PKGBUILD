# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=knotifications
pkgver=6.6.0
pkgrel=1
pkgdesc='Abstraction for system notifications'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         libcanberra
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('28153dce38eb488d228942a2ed197e57739107db1002448ad56bdd5be10bf60d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

