# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib-networking
pkgver=2.80.0
pkgrel=2
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
source=("git+https://gitlab.gnome.org/GNOME/glib-networking.git#tag=${pkgver/[a-z]/.&}")
sha256sums=('4dce76a3b5830ceb35f1fc3123e7c85e0b2f60e04cc56ae1a89451abd5b3012d')

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
