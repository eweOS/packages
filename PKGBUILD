# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kio-extras
pkgver=26.08.3
pkgrel=1
pkgdesc='Additional components to increase the functionality of KIO'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.kde.org/'
license=(LGPL-2.0-or-later)
depends=(karchive
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         kdnssd
         ki18n
         kio
         knotifications
         kservice
         ktextwidgets
         kwidgetsaddons
         libkexiv2
         libproxy
         libxcurcommon
         phonon-qt6
         plasma-activities
         qt6-5compat
         qt6-base
         qt6-svg
         sh
         solid
         syntax-highlighting)
makedepends=(extra-cmake-modules
             gperf
             kdoctools
             openexr
             plasma-activities-stats
             qcoro
             taglib)
optdepends=('icoutils: Windows executable thumbnails'
            'kimageformats: thumbnails for additional image formats'
            'libappimage: AppImage thumbnails'
            'openexr: EXR format thumbnails'
            'perl: info kioslave'
            'plasma-activities-stats: recently used kioslave'
            'qt6-imageformats: thumbnails for additional image formats'
            'taglib: audio file thumbnails')
groups=(kde-applications
        kde-network)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz)
sha256sums=('5ff1e1091b162cd02c226880a6af93e6908ab32993b420fbe8fc10718e168780')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DLIBAPPIMAGE_LIBRARIES=libappimage.so \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
