# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=libplasma
pkgver=6.4.1
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
sha256sums=('3ba4f1f8a9968b1d339564f91b33818e80e612de7e534591117246963d2c717b'
            'f9e4ac7b5a5ddbbee50028f03bdb3cfeba7805838ed481dcc2671e7f1cdfc054')

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
