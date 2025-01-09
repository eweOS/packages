# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib-networking
pkgver=2.80.1
pkgrel=1
pkgdesc="Network extensions for GLib"
url="https://gitlab.gnome.org/GNOME/glib-networking"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  gsettings-system-schemas
  libproxy
)
makedepends=(
  git
  gsettings-desktop-schemas
  meson
)
checkdepends=(ca-certificates)
# 0001: https://gitlab.gnome.org/GNOME/glib-networking/-/issues/222
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${pkgver/[a-z]/.&}"
	"0001-disable-rehandkshake-tests-on-openssl-3.4.patch")
sha256sums=('04986a72644a6c93866f353b1027a94fe66534c19e05812fd97ccf5c744fc890'
            'ddc71817f678204c5bfea04bad9907195c6f3791d534191fd502dbaf4fdca2db')

prepare() {
  _patch_ glib-networking
}

build() {
  ewe-meson glib-networking build -Dopenssl=enabled -Dgnutls=disabled
  meson compile -C build
}

check() {
  meson test -vC build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  # glib-pacrunner.service
  rm -r $pkgdir/usr/lib/systemd
}
