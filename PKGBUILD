# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kmenuedit
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE menu editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         ki18n
         kiconthemes
         kio
         kitemviews
         kservice
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         sonnet)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('2af771dfedc334aaaac0976d66bf9c8c8e830030ad6d2a328b36be44bbc9eec9')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
