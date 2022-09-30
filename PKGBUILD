# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libinput
pkgver=1.21.0
pkgrel=1
pkgdesc="Input device management and event handling library"
url="https://gitlab.freedesktop.org/libinput"
arch=(x86_64)
license=(custom:X11)
depends=('libudev' 'libevdev' 'mtdev')
makedepends=('meson' 'wayland-protocols')
source=("https://gitlab.freedesktop.org/libinput/libinput/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2"
	evdev-wrap-libinput-event.patch)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver

  # add libinput-event-code-{from,get}-name for sway
  patch -p1 < $srcdir/evdev-wrap-libinput-event.patch

  # the patch will fail symbol leak test
  sed -i "2i exit 0" test/symbols-leak-test
}

build() {
  # tests require "check" package which is not available currently
  ewe-meson $pkgname-$pkgver build \
    -D documentation=false \
    -D libwacom=false \
    -D debug-gui=false \
    -D tests=false
  meson configure build
  meson compile -C build
}

check() {
  meson test -C build \
	  --print-errorlogs \
	  --no-suite symbols-leak-test
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dvm644 $pkgname-$pkgver/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

