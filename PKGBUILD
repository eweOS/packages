# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-activities
pkgver=6.1.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Core components for KDE Activities'
arch=(x86_64 aarch64 riscv64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kconfig
         kcoreaddons
         qt6-base)
makedepends=(boost
             extra-cmake-modules
             qt6-declarative
             qt6-tools)
optdepends=('qt6-declarative: QML bindings')
conflicts=(kactivities)
replaces=(kactivities)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('b353fbe7ae30f6a04ef4f81d3e0250654a0f9859a9ef43214c89c78b924e284b')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
