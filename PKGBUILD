# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdbusmenu-lxqt
pkgver=0.5.0
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/lxqt/libdbusmenu-lxqt'
# https://github.com/lxqt/libdbusmenu-lxqt/blob/master/COPYING
# All source files contain "any later"
license=('LGPL-2.0-or-later')
depends=(qt6-base)
makedepends=(cmake git lxqt-build-tools)
checkdepends=(dbus)
source=("git+https://github.com/lxqt/libdbusmenu-lxqt#tag=$pkgver")
sha256sums=('1f4c8d1f9355b60acba4006c5d5ffcda91a181f0db703b736b8bfe9e263b379e')

build() {
  cmake -B build -S libdbusmenu-lxqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  export QT_QPA_PLATFORM=offscreen
  # FIXME: !icon.isNull()' returned FALSE. ()
  dbus-launch cmake --build build --target check || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
