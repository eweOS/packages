# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=desktop-file-utils
pkgver=0.29
pkgrel=1
pkgdesc="Command line utilities for working with desktop entries"
url="https://www.freedesktop.org/wiki/Software/desktop-file-utils"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
depends=(glib)
makedepends=(
  git
  meson
)
source=(
  "git+https://gitlab.freedesktop.org/xdg/desktop-file-utils.git#tag=$pkgver"
  update-desktop-database.hook
)
sha256sums=('c26c2dc6349ba1e4eaa70c4c79367f2555f9ec88edb52cb8774ee77b2e1c24b6'
            '501f1eb35d9fbbd61666f40302b0ce63425299edf023c075986a24dc3ef18575')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}
