# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.10.1
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'mesa' 'pango'
	 'pcre2' 'pixman' 'wayland' 'wlroots0.18' 'gdk-pixbuf')
makedepends=(linux-headers meson wayland-protocols scdoc wlroots0.18-devel)
backup=('etc/sway/config')
source=("https://github.com/swaywm/sway/archive/$pkgver.tar.gz")
sha256sums=('8565ab3b359780f02b1dcb24dc48e5b6b82c64dd97ca795782c2fb4cab62457b')

build() {
  mkdir -p build
  ewe-meson build "$pkgname-$pkgver" \
    -D werror=false \
    -D b_ndebug=true \
    -D sd-bus-provider=basu \
    -D tray=disabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
