# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.44.0
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
source=("$pkgname::git+$url#tag=v$pkgver" "https://patch-diff.githubusercontent.com/raw/hyprwm/Hyprland/pull/7510.patch")
sha256sums=('af9a4181d0ea043538944f39663a88676f4890cea2f455085629aaaedb0dfb57'
            'a6be6ec38a078d9ab22b9919f5c907a2e31165dfb6cd8e86ad4bb6620d0cebf8')

prepare() {
  cd "$pkgname"
  # 32 bit fix breaks build
  patch -R -p1 < $srcdir/7510.patch
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
