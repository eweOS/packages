# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxkbcommon
pkgver=1.13.2
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT MIT-open-group HPND HPND-sell-variant X11
	 LicenseRef-digital-equipment-corporation)
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
sha256sums=('acc4d5f7c3cbba5f9f8d08d8bdbeede84ecede46792f47929aa9321873385528')

build() {
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

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
    -m644 libxkbcommon-xkbcommon-${pkgver}/LICENSE
}
