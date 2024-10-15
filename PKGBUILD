# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=network-manager-applet
pkgname=(
  network-manager-applet
  nm-connection-editor
)
pkgver=1.36.0
pkgrel=1
pkgdesc="Applet for managing network connections"
url="https://gitlab.gnome.org/GNOME/network-manager-applet"
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(
  libnma
  libsecret
  networkmanager
)
makedepends=(
  git
  gobject-introspection
  gtk-doc
  linux-headers
  meson
)
source=("git+https://gitlab.gnome.org/GNOME/network-manager-applet.git#tag=$pkgver")
sha256sums=('f718785ed3a6e6253f1ca182b8332daa322255d3e06d99f0608b599e70b3d44c')

prepare() {
  cd $pkgbase
  sed -i '/gdkx.h/d' src/applet.h
  sed -i '/gdkx.h/d' src/connection-editor/nm-connection-list.c
  sed -i '/gdkx.h/d' src/connection-editor/nm-connection-editor.c
}

build() {
  local meson_options=(
    -D selinux=false
    -D appindicator="no"
    -D wwan=false
  )

  ewe-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_network-manager-applet() {
  depends+=(nm-connection-editor)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ nmce usr/bin/nm-connection-editor
  _pick_ nmce usr/share/applications/nm-connection-editor.desktop
  _pick_ nmce usr/share/icons/hicolor/*/*/nm-device-wwan{,-symbolic}.*
  _pick_ nmce usr/share/locale
  _pick_ nmce usr/share/man/man1/nm-connection-editor.1
  _pick_ nmce usr/share/metainfo
}

package_nm-connection-editor() {
  pkgdesc="NetworkManager GUI connection editor and widgets"
  depends=(
    jansson
    libnma
  )

  mv pkgs/nmce/* "$pkgdir"
}
