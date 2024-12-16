# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kparts
pkgver=6.9.0
pkgrel=1
pkgdesc='Document centric plugin system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         ki18n
         kio
         kwidgetsaddons
         kxmlgui
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('afc9c4e897b371a51589342ed0573889bf4fab79b81b9a6950a45cd9faedd788')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
