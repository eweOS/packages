# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.10.4
pkgrel=1
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
sha256sums=('ad1ead64aec35bc589207ea1edce90e848620d578985967d44a850a66b5ef829'
            '08a90d397f7e7d47c1c4050bb4646724d220094c450a6a877dbaf8236a5d063e')

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
