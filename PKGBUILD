# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sway
pkgver=1.8.1
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64 aarch64 riscv64)
url='https://swaywm.org/'
license=(MIT)
depends=('cairo' 'json-c' 'libinput' 'seatd' 'libxkbcommon' 'mesa' 'pango' 'pcre' 'pixman' 'wayland' 'wlroots' 'gdk-pixbuf' 'elogind')
makedepends=(linux-headers meson wayland-protocols scdoc)
backup=('etc/sway/config')
source=("git+https://github.com/swaywm/sway.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  # Set the version information to 'eweOS' instead of 'makepkg'
  sed -i "s/branch \\\'@1@\\\'/eweOS/g" $pkgname/meson.build
}

build() {
  mkdir -p build
  ewe-meson build "$pkgname" \
    -D werror=false \
    -D b_ndebug=true \
    -D xwayland=disabled \
    -D sd-bus-provider=libelogind
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  for util in autoname-workspaces.py inactive-windows-transparency.py grimshot; do
    install -Dm755 "$pkgname/contrib/$util" -t "$pkgdir/usr/share/$pkgname/scripts"
  done
}
