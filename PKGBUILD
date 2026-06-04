# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kded
pkgver=6.26.0
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
sha256sums=('4265d1162cbd7febf16d103bf1bd9fab858fa3f54f52797ed0938436bee347af')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  rm -r $pkgdir/usr/lib/systemd
}
