# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=adwaita-icon-theme
pkgname=(
  adwaita-icon-theme
  adwaita-cursors
)
pkgver=48.0
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
sha256sums=('cc7b47538cf7f753e8f51fc0d5d31c9940e2885434c93400783fd6505cd07a37')

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
