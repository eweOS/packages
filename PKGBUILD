# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma5support
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Support components for porting from KF5/Qt5 to KF6/Qt6'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kconfig
         kcoreaddons
         kguiaddons
	 kholidays
         ki18n
         kidletime
         kio
         kjobwidgets
         knotifications
         kservice
	 kunitconversion
         libksysguard
         qt6-base
         qt6-declarative
         solid)
makedepends=(extra-cmake-modules
             networkmanager-qt
             plasma-activities
             qt6-tools
             linux-headers)
optdepends=('gpsd: GPS-based geolocation dataengine'
            'networkmanager-qt: IP-based geolocation dataengine'
            'plasma-activities: activities dataengine')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('1a2f3e7ebb85e2a1c54c3aa32b712e8f285289758ba2c8236ec0dc66dd8c5cfd')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
