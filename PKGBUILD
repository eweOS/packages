# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=audex
pkgver=24.08.3
pkgrel=1
pkgdesc='Tool for ripping compact discs'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://apps.kde.org/audex/'
license=(GPL-2.0-or-later)
depends=(kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         ki18n
         kiconthemes
         kio
         ktextwidgets
         kwidgetsaddons
         kxmlgui
         libcdio
         libcdio-paranoia
         libkcddb
         qt6-base
         solid)
makedepends=(extra-cmake-modules)
optdepends=('faac: MP4/M4A/AAC encoder'
            'flac: FLAC encoder'
            'lame: MP3 encoder'
            'vorbis-tools: OGG encoder')
groups=(kde-applications
        kde-multimedia)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('dd605a83dc8f02b9de95bd26deaec33e462a86edbda1bc26d6cf4f5bec626598')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
