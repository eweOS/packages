# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=libplasma
pkgver=6.4.4
pkgrel=1
pkgdesc='Plasma library and runtime components'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('ab0f4b426829821e0abf479052f326a5ce01c3b604e890c9f79949c3eb5fdebe'
            '30cceca08e6d2455152c275669722dc8c7678d69158c0138ef819f77835518a4')

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
