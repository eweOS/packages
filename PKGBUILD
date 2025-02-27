# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=waybar
pkgver=0.12.0
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('80454a0778176f575c112bdef9107f272621b578aa629bcc257ad9844a6c7165')

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
