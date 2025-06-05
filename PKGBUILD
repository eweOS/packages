# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxkbcommon
pkgver=1.10.0
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
makedepends=(
  libxml2
  meson
  bison
  wayland
  wayland-protocols
)
provides=(libxkbcommon.so libxkbregistry.so)
depends=(libxml2 xkeyboard-config)
checkdepends=(weston)
source=("https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${pkgver}.tar.gz")
sha256sums=('0427585a4d6ca17c9fc1ac4b539bf303348e9080af70c5ea402503bc370a9631')

build()
{
  ewe-meson libxkbcommon-xkbcommon-${pkgver} build \
    -Denable-x11=false \
    -Denable-docs=false
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
    -m644 libxkbcommon-xkbcommon-${pkgver}/LICENSE
}
