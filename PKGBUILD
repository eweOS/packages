# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.14.0
pkgrel=2
pkgdesc='Highly customizable Wayland bar for Sway and Wlroots based compositors'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/Alexays/Waybar/"
license=('MIT')
depends=(
  'gtkmm3'
  'libsigc++2'
  'wayland'
  'gtk-layer-shell'
  'libevdev'
  'libinput'
  'libmpdclient'
  'libnl'
  'libxkbcommon'
  'jsoncpp'
  'fmt'
  'spdlog'
  'libpulse'
  'wireplumber'
  'font-awesome'
)
makedepends=(
  'cmake'
  'linux-headers'
  'meson'
  'scdoc'
  'wayland-protocols'
  'python-packaging'
)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('7f3859779bb3a5028a7215b2000c2e476c03453a52289164ba60a4bf1bb3772f')

build() {
  local features=(
    -D tests=disabled
    -D jack=disabled
    -D cava=disabled
    -D dbusmenu-gtk=disabled
    -D upower_glib=disabled
    -D mpris=disabled
    -D sndio=disabled
    -D systemd=disabled
    -D gps=disabled
    -D niri=true
  )

  ewe-meson "Waybar-$pkgver" build --wrap-mode=nodownload \
    "${features[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 $srcdir/Waybar-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
