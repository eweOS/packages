# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.12
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'pango'
	 'pcre2' 'pixman' 'wayland' 'wlroots0.20' 'gdk-pixbuf')
makedepends=(linux-headers meson wayland-protocols scdoc wlroots0.20-devel)
backup=('etc/sway/config')
source=("https://github.com/swaywm/sway/archive/$pkgver.tar.gz")
sha256sums=('29ca7caac960d13e02d8213418d91a5422c7c23102a283ceab944c57c5e1efcf')

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
