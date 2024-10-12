# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal
pkgver=1.19.0
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  glib
  json-glib
  pipewire
  fuse3
  gdk-pixbuf
  bubblewrap
)
makedepends=(
  docbook-xsl
  flatpak
  git
  meson
  xmlto
  python-packaging
)
optdepends=('xdg-desktop-portal-impl: Portal backends')
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver")
sha256sums=('afddbdc9cb5200ee9db4b7167081aa66374ddff4121eacae160b5036d5dbb5cd')

prepare() {
  _patch_ $pkgname
}

build() {
  local features=(
    -D documentation=disabled	# missing python-sphinx
    -D geoclue=disabled
    -D libportal=disabled
    -D systemd=disabled
    -D man-pages=disabled
    -D pytest=disabled
  )
  ewe-meson $pkgname build "${features[@]}"
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove systemd services
  rm -r $pkgdir/usr/lib/systemd || true
}
