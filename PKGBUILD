# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kfilemetadata
pkgver=6.6.0
pkgrel=1
pkgdesc='A library for extracting file metadata'
arch=(x86_64 aarch64 riscv64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(ebook-tools
         exiv2
         ffmpeg
         karchive
         kcodecs
         kconfig
         kcoreaddons
         ki18n
         qt6-base
         taglib)
optdepends=('catdoc: Extract text from Office 98 files'
            'kdegraphics-mobipocket: MOBI extractor'
            'libappimage: AppImage extractor')
makedepends=(catdoc
             extra-cmake-modules
             kdegraphics-mobipocket
             qt6-tools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('218ccbc926e1e26765f7213b8aace7ebdaa785464efad2bb60f8e648362cfea0')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
