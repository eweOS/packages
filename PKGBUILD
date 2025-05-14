# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=adw-gtk-theme
pkgver=6.2
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
sha256sums=('df7abe24ae30700a539e43bda25971b184f3d5e16a6079d4ec98b87ea2f0cd01')

build() {
  ewe-meson adw-gtk3 build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
