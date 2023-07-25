# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=at-spi2-core
pkgver=2.49.1
_gittag='AT_SPI2_CORE_2_49_1'
pkgrel=1
pkgdesc="Protocol definitions and daemon for D-Bus at-spi"
url="https://gitlab.gnome.org/GNOME/at-spi2-core"
arch=(x86_64 aarch64)
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
sha256sums=('dae3cbe384db02e1e484409d74c60748a371c50b677586c03a6cec5753363edc')

build() {
  ewe-meson $pkgname-${_gittag} build -D x11=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
