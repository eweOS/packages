# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=foot
pkgdesc='A fast, lightweight and minimalistic Wayland terminal emulator'
pkgver=1.21.0
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
sha256sums=('b93b196a3fbab86678c54be627557bdc7b1fc8042d99b14c4a74b149f60bcd52')

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
