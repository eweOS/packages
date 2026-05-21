# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=systemsettings
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
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
sha256sums=('8677fe07e66bad787e7ef43e935296c201973a4ec9505ba00d6f3afe4b1cc2c6')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
