# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=systemsettings
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE system manager for hardware, software, and workspaces'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kio
         kirigami
         kitemmodels
         kitemviews
         kjobwidgets
         krunner
         kservice
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('6b14788bf19397f58f0231cb9ccd57c3218ca71afd2d9f1c745581e13fa57748')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
