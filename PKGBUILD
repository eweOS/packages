# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal
# 1.19.1 failed
# https://github.com/flatpak/xdg-desktop-portal/issues/1547
pkgver=1.19.2
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://flatpak.github.io/xdg-desktop-portal/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  geoclue
  glib
  json-glib
  pipewire
  fuse3
  gdk-pixbuf
  bubblewrap
  gstreamer-devel
)
makedepends=(
  docbook-xsl
  flatpak
  git
  libportal
  meson
  xmlto
  python-packaging
)
optdepends=('xdg-desktop-portal-impl: Portal backends')
# 0001: https://github.com/flatpak/xdg-desktop-portal/pull/1548
# 0002: https://github.com/flatpak/xdg-desktop-portal/pull/1550
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver")
sha256sums=('36b141b0fb372b02f991dd25b33235a60a5e3320d1970c20bd767915b69fe1df')

prepare() {
  _patch_ $pkgname
}

build() {
  local features=(
    -D documentation=disabled	# missing python-sphinx
    -D systemd=disabled
    -D man-pages=disabled
    -D pytest=disabled
    -D gudev=disabled           # USB-related: missing have gudev
  )
  ewe-meson $pkgname build "${features[@]}"
  meson compile -C build
}

# missing umockdev, requires gudev
check() {
  # disable usage of bwrap
  XDP_VALIDATE_ICON_INSECURE=1 \
  XDP_TEST_IN_CI=1             \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove systemd services
  rm -r $pkgdir/usr/lib/systemd || true
}
