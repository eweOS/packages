# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=konversation
pkgver=25.08.0
pkgrel=1
pkgdesc='A user-friendly and fully-featured IRC client'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('7fb824266234c3ccbd5f4ed751b7f89688dbfc1bcba50a164d33eb3a27b9073f')

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
