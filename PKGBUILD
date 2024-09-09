# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.43.0
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
sha256sums=('fee6bae21e9bbe1766f28366672d5669efbd5e3dad63a3b9b1c2213f2ecb036b')

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
}
