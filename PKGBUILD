# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.45.0
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=(x86_64 aarch64 riscv64)
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
)
makedepends=(
  git
  cmake
  ninja
  meson
  wayland-protocols
  jq
  hwdata
  vulkan-headers
  hyprwayland-scanner
  linux-headers
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('4fca85e8c27effe33c1f4ea328a0a1e6d86550ece659be7882eb946e385c55ad')

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
