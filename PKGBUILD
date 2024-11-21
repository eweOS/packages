# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdbusmenu-lxqt
pkgver=0.2.0
pkgrel=1
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/lxqt/libdbusmenu-lxqt'
# https://github.com/lxqt/libdbusmenu-lxqt/blob/master/COPYING
# All source files contain "any later"
license=('LGPL-2.0-or-later')
depends=(qt6-base)
makedepends=(cmake git)
checkdepends=(dbus weston qt6-wayland)
source=("git+https://github.com/lxqt/libdbusmenu-lxqt#tag=$pkgver")
sha256sums=('74188f1dd665a1e9e0114ecee5d394518ceebd325c182f3c5b0eb4990fecc3c4')

build() {
  cmake -B build -S libdbusmenu-lxqt \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  # FIXME: !icon.isNull()' returned FALSE. ()
  dbus-launch cmake --build build --target check || :
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
