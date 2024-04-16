# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxkbcommon
pkgver=1.7.0
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64 aarch64 riscv64)
license=(custom)
makedepends=(
  libxml2
  meson
  bison
  wayland
  wayland-protocols
)
depends=(libxml2 xkeyboard-config)
source=("https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-${pkgver}.tar.gz")
sha256sums=('20d5e40dabd927f7a7f4342bebb1e8c7a59241283c978b800ae3bf60394eabc4')

build()
{
  ewe-meson libxkbcommon-xkbcommon-${pkgver} build \
    -Denable-x11=false \
    -Denable-docs=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
    -m644 libxkbcommon-xkbcommon-${pkgver}/LICENSE
}
