# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kde-cli-tools
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Tools based on KDE Frameworks to better interact with the system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kcmutils
         kcompletion
         kconfig
         kcoreaddons
         kdesu
         ki18n
         kiconthemes
         kio
         kparts
         kservice
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-svg
         sh)
makedepends=(extra-cmake-modules
             kdoctools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('1cd1e21cacc1c73f4a25d5e98f3fbe8425ba8f2faa13e4aad83030cbf21fcf4c')

prepare() {
  cd $pkgname-$pkgver
  sed -i '/qtx11extras_p/d; /nextStartupId/d' kdesu/kdesu.cpp
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
