# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-lxqt
pkgver=1.1.0
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KDE Frameworks/libfm-qt'
arch=(x86_64 aarch64 riscv64 loongarch64)
groups=(lxqt)
url='https://github.com/lxqt/xdg-desktop-portal-lxqt'
# https://github.com/lxqt/xdg-desktop-portal-lxqt/blob/1.0.2/LICENSE
# All C/C++ files include "any later"
license=('LGPL-2.1-or-later')
depends=(qt6-base kwindowsystem xdg-desktop-portal libfm-qt)
makedepends=(cmake)
provides=(xdg-desktop-portal-impl)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
        lxqt-portals.conf)
sha256sums=('6be7c08f586f139f75099f27999116ad7cba98b11dbf1d7566fd6bc134538c60'
            '867b15caa72e2a85d2ef566cce9f35d8cdea9ed181fbb0290e5ab50e18a8d4aa')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  # fix detection with x-d-p 1.18
  install -Dm644 ${srcdir}/lxqt-portals.conf  ${pkgdir}/usr/share/xdg-desktop-portal/lxqt-portals.conf
}
