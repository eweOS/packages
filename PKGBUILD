# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-gtk
pkgver=1.15.1
pkgrel=1
pkgdesc="A backend implementation for xdg-desktop-portal using GTK"
url="https://github.com/flatpak/xdg-desktop-portal-gtk"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.0-or-later)
depends=(
  fontconfig
  gdk-pixbuf2
  glib2
  gsettings-desktop-schemas
  gtk3
  xdg-desktop-portal
)
makedepends=(
  git
  meson
  python
  python-packaging
)
optdepends=("evince: Print preview")
provides=(xdg-desktop-portal-impl)
source=("git+$url#tag=$pkgver")
sha256sums=('2c6133f11fecfbdf853c60c6f40644491eb415105532bd9f04193b713e66da5d')

build() {
  local meson_options=(
    -D wallpaper=disabled
  )

  ewe-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # fix detection with x-d-p 1.18
  install -Dm644 /dev/stdin "$pkgdir/usr/share/xdg-desktop-portal/gtk-portals.conf" <<END
[preferred]
default=gtk
END

  rm -r $pkgdir/usr/lib/systemd
}
