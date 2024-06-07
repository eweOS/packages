# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gtkmm
pkgname=gtkmm3
pkgver=3.24.9
pkgrel=1
pkgdesc="C++ bindings for glib"
url="https://www.gtkmm.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(gtk3 pangomm-gtk3 atkmm-gtk3)
makedepends=(meson mm-common perl-xml-parser)
checkdepends=(weston)
options=(!emptydirs)
source=("https://gitlab.gnome.org/GNOME/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.bz2")
sha256sums=('0bc6e7073ad2f29c499c33018d32b56e6f343980e97cbcdf261468404ee73b6c')

build() {
  ewe-meson $pkgbase-$pkgver build \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT
  
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
