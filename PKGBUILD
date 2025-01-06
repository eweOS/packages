# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=vte
pkgname=(
  vte-common
  vte3
  vte4
)
pkgver=0.78.2
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  fast_float
  git
  gobject-introspection
  gperf
  gtk3
  gtk4
  meson
  vala
  linux-headers
)
source=(
  "git+https://gitlab.gnome.org/GNOME/vte.git#tag=$pkgver"
  fix-W_EXITCODE.patch
  no-gnutls-warning.patch
)
sha256sums=('ee407119c0fba400916f30818eba4f705cdf6d1764a6e5f639aff5ace4066748'
            '7dbcba99d14b7c3c67a594beb62dfcd993cc895d5e1ac788187fc4be8a37f898'
            '0a53c59a27c7e5d9170a83da2f1db1df73b69355ab9e8557a4404b13fc7900b0')

prepare() {
  _patch_ vte

  cd vte
  git cherry-pick -n \
    f6095fca4d1baf950817e7010e6f1e7c313b9e2e  \
    6c2761f51a0400772f443f12ea23a75576e195d3  \
    d09330585e648b5c9991dffab4a06d1f127bf916  \
    b262c4432b805c47bc5e1f48f996609b8b8e6ad3
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
