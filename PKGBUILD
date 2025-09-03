# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwallet
pkgver=6.17.0
pkgrel=2
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
sha256sums=('44caf691f47ba246f2efb13f9c8f7123c7e6745d4281560228b8158cc8b93d7d')

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
