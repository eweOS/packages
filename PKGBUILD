# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libksysguard
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Library to retrieve information on the current status of computer hardware'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kauth
         kconfig
         kcoreaddons
         kdeclarative
         ki18n
         kirigami
         kitemmodels
         knewstuff
         kpackage
         kquickcharts
         kservice
	 libcap
         libnl
         libpcap
         lm_sensors
         qt6-5compat
         qt6-base
         qt6-declarative
         solid
         zlib)
makedepends=(extra-cmake-modules
             qt6-tools
             linux-headers)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
install=libksysguard.install
sha256sums=('f12fd2e11d2d504d57556cb520a442ed9660f59c7d4b1fbbb17bee02eba0fb2f')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
