# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=at-spi2-core
pkgver=2.54.0
_gittag="AT_SPI2_CORE_${pkgver//./_}"
pkgrel=1
pkgdesc="Protocol definitions and daemon for D-Bus at-spi"
url="https://gitlab.gnome.org/GNOME/at-spi2-core"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  dbus
  glib
  gsettings-desktop-schemas
  libxml2
)
makedepends=(
  gobject-introspection
  meson
)
# self-needed to test dbus service
checkdepends=(at-spi2-core)
source=("$url/-/archive/${_gittag}/$pkgname-${_gittag}.tar.gz")
sha256sums=('f16330bd10841b929120ba9416d831e769c790219eaebf88b5021d89e6de7c9a')

build() {
  ewe-meson $pkgname-${_gittag} build -D x11=disabled -D use_systemd=false -D default_bus=dbus-daemon
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs
}

package() {
  provides=(
    "at-spi2-atk=$pkgver-$pkgrel"
    "atk=$pkgver-$pkgrel"
    libatk-1.0.so
    libatk-bridge-2.0.so
    libatspi.so
  )

  meson install -C build --destdir "$pkgdir"
  # remove systemd dir
  rm -r $pkgdir/usr/lib/systemd
}
