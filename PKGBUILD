# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.10
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'mesa' 'pango'
	 'pcre2' 'pixman' 'wayland' 'wlroots0.18' 'gdk-pixbuf')
makedepends=(linux-headers meson wayland-protocols scdoc wlroots0.18-devel)
backup=('etc/sway/config')
source=("https://github.com/swaywm/sway/archive/$pkgver.tar.gz")
sha256sums=('3f15f8f96238d2f7a7b44dbcd132de6c81b2c06cc3b073f195f07f7105072ccf')

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
