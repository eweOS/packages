# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.10.3
pkgrel=3
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors'
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Alexays/Waybar/"
license=('MIT')
depends=(
  'gtkmm3'
  'libsigc++2'
  'wayland'
  'gtk-layer-shell'
  'libevdev'
  'libinput'
  'libnl'
  'libxkbcommon'
  'jsoncpp'
  'fmt'
  'spdlog'
  'libpulse'
  'wireplumber'
  'ttf-font-awesome'
)
makedepends=(
  'cmake'
  'linux-headers'
  'meson'
  'scdoc'
  'wayland-protocols'
  'python-packaging'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz"
	"0001-Fix-build-with-fmt11.patch")
sha256sums=('50a9ae85d3dcfef04e4bc4e0f3470f187964e4466c156e5558850cea84a3df5c'
	    'SKIP')

prepare() {
	_patch_ "Waybar-$pkgver"
}

build() {
  local features=(
    -D tests=disabled
    -D jack=disabled
    -D cava=disabled
    -D dbusmenu-gtk=disabled
    -D upower_glib=disabled
    -D mpris=disabled
    -D mpd=disabled
    -D sndio=disabled
    -D systemd=disabled
    -D wireplumber=disabled
  )

  ewe-meson "Waybar-$pkgver" build --wrap-mode=nodownload \
    "${features[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $srcdir/Waybar-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
