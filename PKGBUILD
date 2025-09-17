# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=adwaita-icon-theme
pkgname=(
  adwaita-icon-theme
  adwaita-cursors
)
pkgver=49.0
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
sha256sums=('6223041ce114dcb5bf6255a1f2dcc498c7f8c9086e757b8b4987cad0a8d5f275')

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
