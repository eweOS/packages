# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=foot
pkgdesc='A fast, lightweight and minimalistic Wayland terminal emulator'
pkgver=1.18.1
pkgrel=1
url="https://codeberg.org/dnkl/$pkgname"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(
  meson
  ninja
  python
  tllist
  scdoc
  wayland
  wayland-protocols
  git
  linux-headers
)
depends=(
  fontconfig
  fcft
  libxkbcommon
  ncurses
  pixman
  libutf8proc
  wayland
)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('59d22187f7ceaaaa570a5299b102e8f4692826e98785f89ad9d8911802ccc000')

build() {
  ewe-meson $pkgname build \
    --buildtype=release \
    -D terminfo=disabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
