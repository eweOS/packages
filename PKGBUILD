# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwallet
pkgver=6.14.0
pkgrel=1
pkgdesc='Secure and unified container for user passwords'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gpgme
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         knotifications
         kwidgetsaddons
         kwindowsystem
         libgcrypt
         qca-qt6
         qt6-base)
makedepends=(extra-cmake-modules
             kservice
             qt6-tools)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('a7477e4e5e7ccb43491c5a0eccadf6a33e962088d5af32c4b6b4aacb920f59e3')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
