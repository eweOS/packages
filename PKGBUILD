# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=adw-gtk-theme
pkgver=5.5
pkgrel=1
pkgdesc='Unofficial GTK 3 port of the libadwaita theme'
arch=(any)
url=https://github.com/lassekongo83/adw-gtk3
license=(LGPL-2.1-only)
makedepends=(
  git
  meson
  sassc
)
source=(git+https://github.com/lassekongo83/adw-gtk3.git#tag=v${pkgver})
sha256sums=('SKIP')

build() {
  ewe-meson adw-gtk3 build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
