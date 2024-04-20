# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gobject-introspection
pkgname=(
  gobject-introspection
  gobject-introspection-runtime
  libgirepository
)
pkgver=1.80.1
pkgrel=2
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64 aarch64 riscv64)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
makedepends=(
  glib
  cairo
  git
  libffi
  meson
  python
  python-setuptools
)
_glibver=2.80.0
source=(
  "git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#tag=$pkgver"
)
sha256sums=('SKIP')

prepare() {
  cd $pkgbase
  if [ "$CARCH" == "riscv64" ]; then
    # will stuck at 'Generating tests/generate_typelib' when building on rv64
    sed -i "s@subdir('tests')@warning('Skip tests')@g" meson.build
  fi
}
  
build() {
  local meson_options=(
    -D gtk_doc=false
    -D doctool=disabled
  )

  ewe-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_gobject-introspection() {
  depends=(
    "gobject-introspection-runtime=$pkgver-$pkgrel"
    "libgirepository=$pkgver-$pkgrel"
    glib
    libffi
    python
    python-setuptools
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  python -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase
  python -O -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase

  _pick_ libg usr/include/gobject-introspection-1.0
  _pick_ libg usr/lib/libgirepository-1.0.so*
  _pick_ libg usr/lib/pkgconfig/gobject-introspection*-1.0.pc
  _pick_ libg usr/lib/girepository-1.0/GIRepository-2.0.typelib
  _pick_ libg usr/share/gir-1.0/GIRepository-2.0.gir
  _pick_ libg usr/share/gtk-doc

  _pick_ runtime usr/lib/girepository-1.0
}

package_gobject-introspection-runtime() {
  pkgdesc+=" - runtime"
  depends=("libgirepository=$pkgver-$pkgrel")

  mv pkgs/runtime/* "$pkgdir"
}

package_libgirepository() {
  pkgdesc+=" - runtime library"
  depends=(
    glib
    libffi
  )
  provides=(libgirepository-1.0.so)

  mv pkgs/libg/* "$pkgdir"
}
