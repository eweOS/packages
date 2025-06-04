# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze
pkgver=6.3.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze-icons
         frameworkintegration
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kdecoration
         kguiaddons
         ki18n
         kiconthemes
         kirigami
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules)
optdepends=('breeze-gtk: Breeze widget style for GTK applications')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('5803d8e3d4edf7de26e2df21ec28662b611a0bca505c39b991c7763dba6026ab')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
