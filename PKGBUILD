# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.9
pkgrel=4
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'mesa' 'pango'
	 'pcre2' 'pixman' 'wayland' 'wlroots0.17' 'gdk-pixbuf')
makedepends=(linux-headers meson wayland-protocols scdoc wlroots0.17-devel)
backup=('etc/sway/config')
source=("https://github.com/swaywm/sway/archive/$pkgver.tar.gz")
sha256sums=('b6e4e8d74af744278201792bcc4447470fcb91e15bbda475c647d475bf8e7b0b')

build() {
  mkdir -p build
  ewe-meson build "$pkgname-$pkgver" \
    -D werror=false \
    -D b_ndebug=true \
    -D xwayland=disabled \
    -D sd-bus-provider=basu \
    -D tray=disabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
