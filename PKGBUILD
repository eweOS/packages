# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libinput
pkgver=1.27.1
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev')
makedepends=('meson' 'wayland-protocols' 'check' 'linux-headers')
checkdepends=('python-pytest')
source=("$url/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f6d623dd8230db337a6457645ebca96b9d4788a56385463bb14b8174910dfe23')

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
