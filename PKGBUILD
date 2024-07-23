# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libei
pkgver=1.2.1
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
sha256sums=('SKIP' 'SKIP')

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
