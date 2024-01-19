# Maintainer: YukariChiba <i@0x7f.cc>

pkgname="hyprland"
pkgver="0.34.0"
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
  libegl
)
makedepends=(
  git
  cmake
  ninja
  meson
  wayland-protocols
  jq
  hwdata
)
_commit="03ebbe18ed8517ee22591eac82cd54322f42cb7d"
source=("$pkgname::git+$url#commit=${_commit}" "0_fix-musl-pagesize.patch::$url/pull/4321.patch")
sha256sums=('SKIP'
            'e3298c4cacbe3d4d0dd7062d68b829a7e6822424e9faa40217e963121749e49a')

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
    -Dwlroots:backends=drm,libinput \
    -Dwlroots:xwayland=disabled \
    -Dwlroots:renderers=gles2
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  # hyprland does not support using system wlroots
  rm -r $pkgdir/usr/lib $pkgdir/usr/include/wlr
}
