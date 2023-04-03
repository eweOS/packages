# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinput
pkgver=1.22.0
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64 aarch64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev')
makedepends=('meson' 'wayland-protocols')
source=("$url/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ebbe5a966cf2a12f59666adbfb505cafca58635b96239bbcdf04a09dc4cd0d7b')

build()
{
  # tests require "check" package which is not available currently
  ewe-meson $pkgname-$pkgver build \
    -D documentation=false \
    -D libwacom=false \
    -D debug-gui=false \
    -D tests=false
  meson configure build
  meson compile -C build
}

check()
{
  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
