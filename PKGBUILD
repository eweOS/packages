# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=audex
pkgver=24.12.0
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
sha256sums=('8682a078cf2749eb9b5fbacc43faa171666abd531cf0b98dafde19a71566eeaf')

build() {
  cmake -B build -S $pkgname-$pkgver
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
