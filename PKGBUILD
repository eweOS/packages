# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=konversation
pkgver=24.08.2
pkgrel=1
pkgdesc='A user-friendly and fully-featured IRC client'
arch=(x86_64 aarch64 riscv64)
url='https://apps.kde.org/konversation/'
license=(GPL-2.0-or-later)
depends=(karchive
         kbookmarks
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         ki18n
         kidletime
         kio
         kitemviews
         knewstuff
         knotifications
         knotifyconfig
         kparts
         kstatusnotifieritem
         ktextwidgets
         kwallet
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         perl
         qca-qt6
         qt6-5compat
         qt6-base
         qt6-multimedia
         qt6-tools
         sh)
optdepends=('keditbookmarks: for managing bookmarks'
            'python: python scripting support')
makedepends=(extra-cmake-modules kdoctools)
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('ac22e3a7db7e8834f7cd0ad8e3984ab84acad88a04fe43b3e16c91e743526cae')

prepare() {
  cd $pkgname-$pkgver
  # disable x11
  sed -i 's/UNIX AND NOT APPLE AND NOT HAIKU/NOT UNIX AND NOT APPLE AND NOT HAIKU/' CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
