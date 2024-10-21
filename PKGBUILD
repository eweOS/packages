# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwallet
pkgver=6.6.0
pkgrel=2
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
sha256sums=('b319cc4cf79cc1796e7246f61bbc56bba070aa5ec994b30e11b1faa685ce7d54')

prepare() {
  sed -i 's/define HAVE_X11 1/define HAVE_X11 0/; /<KX11Extras>/d' $pkgname-$pkgver/src/runtime/kwalletd/kwalletd.cpp
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
