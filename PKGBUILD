# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=gobject-introspection
pkgname=(
  gobject-introspection
  gobject-introspection-runtime
  libgirepository
)
pkgver=1.82.0
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64 aarch64 riscv64)
license=(
  GPL-2.0-or-later
  LGPL-2.0-or-later
)
makedepends=(
  glib
  gtk-doc
  cairo
  git
  libffi
  meson
  python
  python-setuptools
  python-markdown
  python-mako
)
source=(
  "git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git"
)
sha256sums=('cdc0a0e5d496bb08a488471326d182ffb09c8960ce2df56141dd18e41ef1f348'
            'SKIP')


prepare() {
  cd $pkgbase

  git submodule init
  git submodule set-url gobject-introspection-tests "$srcdir/gobject-introspection-tests"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  ewe-meson $pkgbase build
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
