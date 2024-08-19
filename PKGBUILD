# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libei
pkgver=1.3.0
pkgrel=1
pkgdesc="Library for Emulated Input"
url="https://libinput.pages.freedesktop.org/libei/"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(
  libevdev
  basu
)
makedepends=(
  git
  linux-headers
  libxkbcommon
  meson
  python-attrs
  python-dbusmock
  python-jinja
  python-pytest
  python-structlog
  python-yaml
)
#checkdepends=(
#  python-pytest-xdist
#  valgrind
#)
provides=(
  lib{ei,eis,oeffis}.so
)
source=(
  "git+https://gitlab.freedesktop.org/libinput/libei.git#tag=$pkgver"
  "git+https://github.com/nemequ/munit.git"
)
sha256sums=('fbce70e474671c00d36861a3f11f0140c63643346f22fd6f0f40f41cf916f25c'
            'SKIP')

prepare() {
  cd libei
  ln -s ../munit subprojects/munit
}

build() {
  ewe-meson libei build -D sd-bus-provider=basu -D tests=disabled
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir" --skip-subprojects
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 libei/COPYING
}
