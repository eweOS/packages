# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-activities-stats
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='A library for accessing the usage data collected by the activities system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(plasma-activities
         kconfig
         qt6-base)
makedepends=(extra-cmake-modules
             qt6-tools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('7f281b6840d33f934a4252fd74846913321214472fe431e5432b891f8d212a10')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
