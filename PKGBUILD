# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal
# 1.19.1 failed
# https://github.com/flatpak/xdg-desktop-portal/issues/1547
pkgver=1.19.1
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
source=("git+https://github.com/flatpak/xdg-desktop-portal#tag=$pkgver"
        "0001-fix-build-without-pytest-enabled.patch"
        "0002-fix-build-without-wavparse.patch")
sha256sums=('9b03626ec1a1f6ca2f89aff314b2449465d2cd2176aecf8d7915804891664fa9'
            '1f9adbcc1e3231aba8ed1b9cb6bb20f1eb962bc50e810575bec1094e46230af2'
            '55faba915add7fe01e3b1ba491693d71b765e49469241e576e60639c78fcab5b')

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
