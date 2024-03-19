# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.10.0
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
  'meson'
  'scdoc'
  'wayland-protocols'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('3af6665889868f2334ba1793c8b0f3104c4c3b176a8c759f0d08f07266ad2620')

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
  )

  ewe-meson "Waybar-$pkgver" build --wrap-mode=nodownload \
    "${features[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $srcdir/Waybar-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
