# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=adw-gtk-theme
pkgver=5.7
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
sha256sums=('1eb1b88381e7e495af10ec354a09cb0981f9699abf7ce89264a2e3d16cd4d495')

build() {
  ewe-meson adw-gtk3 build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
