# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=foot
pkgdesc='A fast, lightweight and minimalistic Wayland terminal emulator'
pkgver=1.17.1
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
sha256sums=('da49d302fb98d61e674dace27d44ab6e6e6446a1ee156a09a430efb738d74b39')

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

