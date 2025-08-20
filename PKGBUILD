# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma5support
pkgver=6.4.4
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Support components for porting from KF5/Qt5 to KF6/Qt6'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(kconfig
         kcoreaddons
         kguiaddons
         ki18n
         kidletime
         kio
         kjobwidgets
         knotifications
         kservice
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
sha256sums=('066c0456149bacad6dfd99eb36783fb61f1918df91b9d70ff4aeac56e3d43bf5')

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
