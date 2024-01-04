# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.9.20
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
  'meson'
  'scdoc'
  'wayland-protocols'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('e300183defece4799b6dfb7aea72400492ec6e330217c22158a334f35532d014')

build() {
  local features=(
    -D tests=disabled
    -D dbusmenu-gtk=disabled
    -D jack=disabled
    -D cava=disabled
    -D upower_glib=disabled
    -D mpris=disabled
    -D mpd=disabled
    -D sndio=disabled
    -D systemd=disabled
  )

  ewe-meson "Waybar-$pkgver" build --wrap-mode=nodownload \
    "${features[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $srcdir/Waybar-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
