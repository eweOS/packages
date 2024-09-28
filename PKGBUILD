# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libplasma
pkgver=6.1.5
pkgrel=1
pkgdesc='Plasma library and runtime components'
arch=(x86_64 aarch64 riscv64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(plasma-activities
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kglobalaccel
         ki18n
         kiconthemes
         kio
         kirigami
         knotifications
         kpackage
         ksvg
         kwidgetsaddons
         kwindowsystem
         libglvnd
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-tools)
conflicts=(plasma-framework)
replaces=(plasma-framework)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('77c2b83ade6999ac0e5269a4e8728443a7d61946d68d0bb41106ab4292a79cc9'
            '31f70a306b1798a109622fd126d14fcf5cbce9e341a5f50428ca8b5387dba5d7')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITHOUT_X11=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
