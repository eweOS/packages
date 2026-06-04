# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ktexteditor
pkgver=6.26.0
pkgrel=1
pkgdesc='Advanced embeddable text editor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(editorconfig-core-c
         karchive
         kauth
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kguiaddons
         ki18n
         kio
         kitemviews
         kparts
         kwidgetsaddons
         kxmlgui
         qt6-declarative
         qt6-base
         qt6-speech
         sonnet
         syntax-highlighting)
makedepends=(extra-cmake-modules
             qt6-tools)
optdepends=('git: git integration')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('ec7bc094f93d514b5f675ae95c274dd24acc47769d971606d8708cc88f811341')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
