# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver="0.40.0"
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
source=(
  "$pkgname::git+$url#tag=v$pkgver"
  hyprwayland-scanner.patch::https://github.com/hyprwm/Hyprland/commit/ec092bd601d9d351ff6ca34bd97f12055b2a4dd9.patch
)
sha256sums=('SKIP'
            'a4ab9aad0aeba3aa1f806f5716b01745ef1ea24bae1349b1d2fe3ab29fee5e1c')

prepare() {
  _patch_ $pkgname
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
  rm -r $pkgdir/usr/lib $pkgdir/usr/include/wlr
}
