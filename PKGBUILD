# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=seahorse
pkgver=47.0.1
pkgrel=2
pkgdesc="GNOME application for managing PGP keys."
url="https://wiki.gnome.org/Apps/Seahorse"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-or-later AND LGPL-2.1-or-later AND CC-BY-SA-3.0')
depends=(
  dconf
  gcr
  gdk-pixbuf2
  glib2
  gpgme
  gtk3
  hicolor-icon-theme
  libhandy
  libldap
  libpwquality
  libsecret
  libsoup3
  openssh
  org.freedesktop.secrets
)
makedepends=(
  git
  glib2
  gobject-introspection
  meson
  vala
  yelp-tools
)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/seahorse.git#tag=${pkgver/[a-z]/.&}")
sha256sums=('e5b190aec564b34247a82f745eba42a8f02be913638f9b71e043bc01cea51a75')

prepare() {
  cd seahorse

  # Fix symbolic icon name
  # https://gitlab.gnome.org/GNOME/seahorse/-/merge_requests/230
  git cherry-pick -n c6fcd381425b638c16eeab7e5858bddf7de76b9f
}

build() {
  ewe-meson seahorse build -D manpage=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
