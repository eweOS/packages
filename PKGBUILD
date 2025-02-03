# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=foot
pkgdesc='A fast, lightweight and minimalistic Wayland terminal emulator'
pkgver=1.20.2
pkgrel=1
url="https://codeberg.org/dnkl/$pkgname"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('9a8832e2485923c8a79e77958c8b0357abd159dfa8958609402362da8e56c073')

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
