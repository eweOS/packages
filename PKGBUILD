# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxkbcommon
pkgver=1.12.1
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
# 0001: Under review, fix test failures on musl where newlocale() doesn't
#	complain about invalid locales.
#	https://github.com/xkbcommon/libxkbcommon/pull/880
source=("https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${pkgver}.tar.gz"
	"0001-compose-No-fallback-if-no-missing-locale-detection.patch")
sha256sums=('bb1543d956a5b962ee414174e9882c5d6fac3af9f95ebf48defb105151780ed1'
            '5474fe234a693389dd341f1bf55459af43d592b394253324eaec5ca83f651387')

prepare() {
  _patch_ libxkbcommon-xkbcommon-${pkgver}
}

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
