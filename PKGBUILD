# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxkbcommon
pkgver=1.4.1
pkgrel=1
pkgdesc='Keymap handling library for toolkits and window systems'
url='https://xkbcommon.org/'
arch=(x86_64 aarch64)
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
sha256sums=('SKIP')

build()
{
  ewe-meson libxkbcommon-xkbcommon-${pkgver} build \
    -Denable-x11=false \
    -Denable-docs=false \
    -Denable-xkbregistry=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" \
    -m644 libxkbcommon-xkbcommon-${pkgver}/LICENSE
}
