# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kde-cli-tools
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=3
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
             qt6-base-devel
             kdoctools)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('083b5d3c8e6315554547e1fc538c7d9f0671e08f7c52f2bc0a5a345027a12279')

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
