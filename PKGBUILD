# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kded
pkgver=6.20.0
pkgrel=1
pkgdesc='Extensible deamon for providing system level services'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kservice
         qt6-base)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('1d6c950048e05b9e8038cfdf84963d1d4b8bfc5f326f301e743211791e9a9f65')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  rm -r $pkgdir/usr/lib/systemd
}
