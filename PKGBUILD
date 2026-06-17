# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprland"
pkgver=0.55.4
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
  muparser
  hyprwire
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
_archive="${pkgname^}-$pkgver"
source=("$_archive.tar.gz::$url/releases/download/v$pkgver/source-v$pkgver.tar.gz")
sha256sums=('10cdda47e6a42e603a646ffda89c9fca0628c3a8211e2fbbee02f6282effe30b')

prepare() {
  ln -sf hyprland-source "$_archive"
  sed -i '/xcb.h/d' "$_archive"/src/xwayland/Dnd.hpp
  sed -i '/xfixes.h/d; /xproto.h/d' "$_archive"/src/xwayland/XWM.cpp
  sed -i 's/OpenGL::GL/OpenGL::OpenGL/' "$_archive"/CMakeLists.txt
  sed -i -e '/^release:/{n;s/-D/-DCMAKE_SKIP_RPATH=ON -D/}' "$_archive"/Makefile
}

build() {
  cmake -B build -S "$_archive" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DNO_XWAYLAND=1 \
    -DNO_SYSTEMD=1
  cmake --build build --config Release --target all
}

package() {
  DESTDIR=$pkgdir cmake --install build
  rm -fv "$pkgdir/usr/include/hyprland/src/version.h.in"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive"/LICENSE
}
