# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kmenuedit
pkgver=6.8.3
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
         hicolor-icon-theme
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
sha256sums=('08a401cec5b0d0c8d918ff72b9e8f0af8f0fc1c72e71f095947f94c6bc2fc333')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
