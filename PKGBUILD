# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=purpose
pkgver=6.14.0
pkgrel=1
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
             intltool)
optdepends=('bluedevil: sharing via Bluetooth'
            'kdeclarative: Nextcloud and YouTube plugins'
            'kdeconnect: sharing to smartphone via KDE Connect'
            'prison: QR code plugin'
            'telegram-desktop: sharing via Telegram')
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('dd9f23baf4c4a44f1c71f7d3b0bfe7fbfbcdda2002d74d4b49cd84631ac899e9')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
