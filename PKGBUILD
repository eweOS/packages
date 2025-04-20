# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=adw-gtk-theme
pkgver=5.10
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
sha256sums=('e88cde50ca58cb512d3e9b8e4f63186bb1f2c75b84069554bb948316ad27aa39')

build() {
  ewe-meson adw-gtk3 build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
