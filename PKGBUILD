# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=foot
pkgdesc='A fast, lightweight and minimalistic Wayland terminal emulator'
pkgver=1.16.2
pkgrel=1
url="https://codeberg.org/dnkl/$pkgname"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
makedepends=(
  meson
  ninja
  python
  tllist
  sway
  scdoc
  wayland
  wayland-protocols
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0e02af376e5f4a96eeb90470b7ad2e79a1d660db2a7d1aa772be43c7db00e475')

prepare() {
  sed -i 's/werror=true/werror=false/g' $pkgname/meson.build
}

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

