# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.8
pkgrel=2
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'mesa' 'pango' 'pcre' 'pixman' 'wayland' 'wlroots' 'gdk-pixbuf')
makedepends=(linux-headers meson wayland-protocols scdoc)
backup=('etc/sway/config')
source=("git+https://github.com/swaywm/sway.git#tag=1.8")
sha256sums=('SKIP')

build() {
  mkdir -p build
  ewe-meson build "$pkgname" \
    -D werror=false \
    -D b_ndebug=true \
    -Dxwayland=disabled \
    -Dtray=disabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$pkgname/contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
  done
}

