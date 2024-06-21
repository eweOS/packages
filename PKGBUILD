# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver="0.41.1"
pkgrel=2
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
sha256sums=('SKIP')

prepare() {
  sed -i 's@g++ -std=c++23@c++ -std=c++2b@g' $pkgname/hyprctl/Makefile
}

build() {
  cd "$srcdir"
  CXXFLAGS+=" -fexperimental-library"
  ewe-meson $pkgname build \
    -Dsystemd=disabled \
    -Dxwayland=disabled \
    -Dwlroots-hyprland:backends=drm,libinput \
    -Dwlroots-hyprland:xwayland=disabled \
    -Dwlroots-hyprland:renderers=gles2,vulkan
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  # hyprland does not support using system wlroots
  rm -r $pkgdir/usr/lib
}
