# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libei
pkgver=1.4.1
pkgrel=1
pkgdesc="Library for Emulated Input"
url="https://libinput.pages.freedesktop.org/libei/"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('640184b3981f394de2fe9b6e39ff14a570a2839e0e6d722d606631727a7f812e'
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
