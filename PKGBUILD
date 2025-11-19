# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=systemsettings
pkgver=6.5.2
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
sha256sums=('f6f3b2192160f08c829c00fe4c0315f9c06288d4c4daf287141e11e83d8a4bce')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
