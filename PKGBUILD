# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libinput
pkgver=1.25.0
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64 aarch64 riscv64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev')
makedepends=('meson' 'wayland-protocols')
source=("$url/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f7e8425f185cadba5761d0a1dae6be041750d351163ffa04adc5b9a79a13c0ec')

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
  # FIXME: no pytest in repo
  pip install pytest
  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
