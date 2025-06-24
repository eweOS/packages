# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kfilemetadata
pkgver=6.15.0
pkgrel=1
pkgdesc='A library for extracting file metadata'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('d1e62ce1b7fd65e848a81a211bb5cb1126cce1354f70312a0104c09c03dd6542')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
