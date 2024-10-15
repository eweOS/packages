# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libnma
pkgname=(
  libnma-common
  libnma-gtk3
  libnma-gtk4
)
pkgver=1.10.6
pkgrel=1
pkgdesc="NetworkManager GUI client library"
url="https://gitlab.gnome.org/GNOME/libnma"
arch=(x86_64 aarch64 riscv64)
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
makedepends=(
  dconf
  gcr-4
  git
  gobject-introspection
  gtk-doc
  gtk3
  gtk4
  iso-codes
  libnm
  libudev
  meson
  mobile-broadband-provider-info
  vala
)
source=(
  "git+https://gitlab.gnome.org/GNOME/libnma.git#tag=$pkgver"
)
sha256sums=('74d70a049b3a675d3b2d7a14ada92cd763901b17f257d724c47777a8952c94d1')

build() {
  local meson_options=(
    -D libnma_gtk4=true
  )

  ewe-meson libnma build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libnma-common() {
  pkgdesc+=" (common files)"
  depends=(
    dconf
    gcr-4
    iso-codes
    libnm
    mobile-broadband-provider-info
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ gtk3 usr/lib/libnma.so*
  _pick_ gtk3 usr/lib/pkgconfig/libnma.pc
  _pick_ gtk3 usr/lib/girepository-1.0/NMA-*
  _pick_ gtk3 usr/share/gir-1.0/NMA-*
  _pick_ gtk3 usr/share/vala/vapi/libnma.*

  _pick_ gtk4 usr/lib/libnma-gtk4.so*
  _pick_ gtk4 usr/lib/pkgconfig/libnma-gtk4.pc
  _pick_ gtk4 usr/lib/girepository-1.0/NMA4-*
  _pick_ gtk4 usr/share/gir-1.0/NMA4-*
  _pick_ gtk4 usr/share/vala/vapi/libnma-gtk4.*

  # Moved to network-manager-applet 1.30.0
  # https://bugs.archlinux.org/task/76489
  rm usr/share/glib-2.0/schemas/org.gnome.nm-applet.gschema.xml
}

package_libnma-gtk3() {
  pkgdesc+=" (GTK3)"
  depends=(
    libnma-common="$pkgver-$pkgrel"
    gtk3
  )
  provides=(libnma.so libnma)

  mv pkgs/gtk3/* "$pkgdir"
}

package_libnma-gtk4() {
  pkgdesc+=" (GTK4)"
  depends=(
    libnma-common="$pkgver-$pkgrel"
    gtk4
  )
  provides=(libnma-gtk4.so)

  mv pkgs/gtk4/* "$pkgdir"
}
