# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal
pkgver=1.22.0
# These libraries aren't designed to be packaged separately. Don't waste time
# on them.
_libglnx_commit=ff64d52116ae74f0d25e24f089db28921ea171ff
_gvdb_commit=c6f2359cc1d00f16e0a0e2527fa0bc1882b8b5ab
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
  libgudev
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
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver"
	"git+https://gitlab.gnome.org/GNOME/libglnx.git#commit=$_libglnx_commit"
	"git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=$_gvdb_commit")
sha256sums=('9d811c5a6d0810618c994f93ea215708d071547a57fe61194828a5aa47c61490'
            'c375bfb4449614cc81abe511f3abfb730618b293d384c6f855322a3be386ad62'
            '1c4819a29dbde4244375d014aeb679f323f24c92b566824d8bbee8f0f1a07beb')

prepare() {
  _patch_ $pkgname
}

build() {
  local features=(
    -D documentation=disabled	# TODO: enable documentation
    -D systemd=disabled
    -D man-pages=disabled
    -D tests=disabled		# missing gudev
  )
  MESON_PACKAGE_CACHE_DIR="$srcdir" \
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
