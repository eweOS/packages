# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=vte
pkgname=(
  vte-common
  vte3
  vte4
)
pkgver=0.76.3
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64 aarch64 riscv64)
license=(
  # Library
  LGPL-3.0-or-later

  # Demo app, some supporting files
  GPL-3.0-or-later

  # COPYING.XTERM (X11 license) only applies to the disabled SIXEL code
)
depends=(
  cairo
  fribidi
  gdk-pixbuf2
  glib2
  icu
  lz4
  pango
  pcre2
)
makedepends=(
  at-spi2-core
  git
  gobject-introspection
  gperf
  gtk3
  gtk4
  meson
  vala
  linux-headers
)
source=("git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver" fix-W_EXITCODE.patch)
sha256sums=('SKIP'
            '7dbcba99d14b7c3c67a594beb62dfcd993cc895d5e1ac788187fc4be8a37f898')

prepare() {
  _patch_ vte
}

build() {
  ewe-meson vte build -D gnutls=false -D _systemd=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_vte-common() {
  pkgdesc+=" (common files)"

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ gtk3 usr/bin/vte-2.91
  _pick_ gtk3 usr/include/vte-2.91
  _pick_ gtk3 usr/lib/libvte-2.91.so*
  _pick_ gtk3 usr/lib/pkgconfig/vte-2.91.pc
  _pick_ gtk3 usr/lib/girepository-1.0/Vte-2.91.typelib
  _pick_ gtk3 usr/share/gir-1.0/Vte-2.91.gir
  _pick_ gtk3 usr/share/glade
  _pick_ gtk3 usr/share/vala/vapi/vte-2.91.{deps,vapi}

  _pick_ gtk4 usr/bin/vte-2.91-gtk4
  _pick_ gtk4 usr/include/vte-2.91-gtk4
  _pick_ gtk4 usr/lib/libvte-2.91-gtk4.so*
  _pick_ gtk4 usr/lib/pkgconfig/vte-2.91-gtk4.pc
  _pick_ gtk4 usr/lib/girepository-1.0/Vte-3.91.typelib
  _pick_ gtk4 usr/share/gir-1.0/Vte-3.91.gir
  _pick_ gtk4 usr/share/vala/vapi/vte-2.91-gtk4.{deps,vapi}
}


package_vte3() {
  pkgdesc+=" (GTK3)"
  depends+=(
    at-spi2-core
    gtk3
    vte-common
  )
  provides+=(libvte-2.91.so)

  mv pkgs/gtk3/* "$pkgdir"
}

package_vte4() {
  pkgdesc+=" (GTK4)"
  depends+=(
    gtk4
    vte-common
  )
  provides+=(libvte-2.91-gtk4.so)

  mv pkgs/gtk4/* "$pkgdir"
}
