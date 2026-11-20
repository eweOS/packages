# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=adwaita-icon-theme
pkgname=(
  adwaita-icon-theme
  adwaita-cursors
)
pkgver=51.0
pkgrel=1
pkgdesc="GNOME standard icons"
url="https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
arch=(any)
license=(
  CCPL:by-sa
  LGPL3
)
depends=(
  hicolor-icon-theme
  gtk-update-icon-cache
  librsvg
)
makedepends=(
  git
  gtk3
  meson
)
source=("git+https://gitlab.gnome.org/GNOME/adwaita-icon-theme.git#tag=$pkgver")
sha256sums=('fa2e0176d112e72d673d6a20f72eee169dac948522e99c40a3feedac38fc575b')

build() {
  ewe-meson $pkgbase build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_adwaita-icon-theme() {
  depends+=(adwaita-cursors)
  meson install -C build --destdir "$pkgdir"
  mkdir -p cursors/usr/share/icons/Adwaita
  mv {"$pkgdir",cursors}/usr/share/icons/Adwaita/cursors
}

package_adwaita-cursors() {
  pkgdesc="GNOME standard cursors"
  depends=()
  mv cursors/* "$pkgdir"
  # deduplicate cursors
  hardlink -c "$pkgdir/usr"
}
