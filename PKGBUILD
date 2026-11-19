# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwallet
pkgver=6.32.0
pkgrel=1
pkgdesc='Secure and unified container for user passwords'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=(gpgmepp
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
         libsecret
         qca-qt6
         qt6-base)
makedepends=(extra-cmake-modules
	     kdoctools
             kservice
             qt6-tools)
optdepends=('kwalletmanager: Configuration GUI')
provides=(org.freedesktop.secrets)
groups=(kf6)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d68f74617519d1ebc88f152c29d51333f600b9f0aa8757c0a4fe49a40a5107fa')

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
