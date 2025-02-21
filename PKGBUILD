# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal
pkgver=1.20.0
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
# checkdepends=(python-pytest umockdev)
optdepends=('xdg-desktop-portal-impl: Portal backends')
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver")
sha256sums=('1026691ab0509a247a569fb92f442ac4d0f599f2d68643a9ee037247a271cd4d')

prepare() {
  _patch_ $pkgname
}

build() {
  local features=(
    -D documentation=disabled	# TODO: enable documentation
    -D systemd=disabled
    -D man-pages=disabled
    -D tests=disabled		# missing gudev
    -D gudev=disabled           # USB-related: missing have gudev
  )
  ewe-meson $pkgname build "${features[@]}"
  meson compile -C build
}

# missing umockdev, requires gudev
# check() {
#  # disable usage of bwrap
#  XDP_VALIDATE_ICON_INSECURE=1 \
#  XDP_TEST_IN_CI=1             \
#    meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  # remove systemd services
  rm -r $pkgdir/usr/lib/systemd || true
}
