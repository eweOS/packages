# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kfilemetadata
pkgver=6.14.0
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
sha256sums=('925a9db27176519099d24625070bf7ebc1600fae7e7d06ae4eee3279a67d31e5')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
