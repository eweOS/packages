# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libinput
pkgver=1.31.1
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev' 'lua54')
makedepends=('meson' 'wayland-protocols' 'check' 'linux-headers')
checkdepends=('python-pytest')
source=("$url/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e010b02021b8fe9f3e696a4a2059c0243f0c90f2f9d4bcf4c88d2f9613c52b0b')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D documentation=false \
    -D libwacom=false \
    -D debug-gui=false
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
