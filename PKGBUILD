# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.51.0
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/Hyprland"
license=('BSD')
depends=(
  pixman
  wayland-protocols
  libdisplay-info
  cairo
  pango
  libinput
  libxkbcommon
  pixman
  wayland
  seatd
  tomlplusplus
  libdrm
  vulkan-icd-loader
  libegl
  hyprcursor
  hyprutils
  glslang
  aquamarine
  libxcurcommon-compat
  hyprgraphics
  re2
)
makedepends=(
  git
  cmake
  ninja
  meson
  glaze
  wayland-protocols
  hyprland-protocols
  jq
  hwdata
  vulkan-headers
  hyprwayland-scanner
  linux-headers
)
optdepends=('cmake: to build and install plugins using hyprpm'
            'cpio: to build and install plugins using hyprpm'
            'glaze: to build and install plugins using hyprpm'
            'hyprland-protocols: to build and install plugins using hyprpm'
            'meson: to build and install plugins using hyprpm'
            'uwsm: the recommended way to start Hyprland')
source=(
  "$pkgname::git+$url#tag=v$pkgver"
)
sha256sums=('35b136529df68c031f93d587e6163fa443b8920d4a6b17052a17d16f6cea5ba0')

prepare() {
  sed -i '/xcb.h/d' $pkgname/src/xwayland/Dnd.hpp
  sed -i '/xfixes.h/d; /xproto.h/d' $pkgname/src/xwayland/XWM.cpp
}

build() {
  cd "$srcdir"
  CXXFLAGS+=" -fexperimental-library"
  ewe-meson $pkgname build \
    -Dsystemd=disabled \
    -Dxwayland=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
