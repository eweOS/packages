# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=at-spi2-core
pkgver=2.52.0
_gittag='AT_SPI2_CORE_2_52_0'
pkgrel=1
pkgdesc="Protocol definitions and daemon for D-Bus at-spi"
url="https://gitlab.gnome.org/GNOME/at-spi2-core"
arch=(x86_64 aarch64 riscv64)
license=(GPL2)
provides=(atk)
depends=(
  dbus
  glib
  libxml2
)
makedepends=(
  gobject-introspection
  meson
)
source=("$url/-/archive/${_gittag}/$pkgname-${_gittag}.tar.gz")
sha256sums=('6defe926004c4ce99b1a1f0ec507de6fa8cb29d0ff9f096f54482b853cb640c9')

build() {
  ewe-meson $pkgname-${_gittag} build -D x11=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  # remove systemd dir
  rm -r $pkgdir/usr/lib/systemd
}
