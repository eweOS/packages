# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=ktexteditor
pkgver=6.20.0
pkgrel=2
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
sha256sums=('3f59d16fd71de258fe531b65720d764fab85d0b3cf0423201c9f66c4042e64cc')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
