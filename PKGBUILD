# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=purpose
pkgver=6.15.0
pkgrel=2
pkgdesc='Framework for providing abstractions to get the developers purposes fulfilled'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(kcmutils
         kconfig
         kcoreaddons
         ki18n
         kio
         kirigami
         knotifications
         kservice
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             qt6-tools     
             intltool)
optdepends=('bluedevil: sharing via Bluetooth'
            'kdeclarative: Nextcloud and YouTube plugins'
            'kdeconnect: sharing to smartphone via KDE Connect'
            'prison: QR code plugin'
            'telegram-desktop: sharing via Telegram')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d1c0c94a6a6ca11e2dc447431d005e11a73dec33692bef619b0b97bb525fc49e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
