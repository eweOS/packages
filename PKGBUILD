# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.49.0
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
  "fix-ostringstream.patch::https://github.com/hyprwm/Hyprland/commit/fcb6f936ea8b39ec42f5979e55c7aa4a060d2f30.patch"
)
sha256sums=('1826a603c9159d611b4f6fb40c87413b6a2703394cacbfcb9a09261f6a0c75e0'
            'c5e90b93efd4c2980bcab9f9237bee6b9c3effaee1a40f45133c5f615b669d30')

prepare() {
  _patch_ $pkgname
  sed -i '/xcb.h/d' $pkgname/src/xwayland/Dnd.hpp
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
