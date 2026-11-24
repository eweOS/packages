# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=konsole
pkgver=26.08.3
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://apps.kde.org/konsole/'
pkgdesc='KDE terminal emulator'
license=(GPL-2.0-or-later
         LGPL-2.0-or-later)
groups=(kde-applications
        kde-utilities)
depends=(musl
         llvm-libs
         icu
         kbookmarks
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         knotifyconfig
         kparts
         kpty
         kservice
         ktextwidgets
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         qt6-multimedia)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('keditbookmarks: to manage bookmarks')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('3189d1d048300fbe0628eab001b8ea11bfd6fe4fb6c0bbabc7c5aa0461dad430')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
