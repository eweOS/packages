# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gjs
pkgver=1.88.1
pkgrel=1
pkgdesc="Javascript Bindings for GNOME"
url="https://wiki.gnome.org/Projects/Gjs"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(
  cairo
  dconf
  glib2
  gobject-introspection-runtime
  js140
  libffi
  libgirepository
  readline
)
makedepends=(
  dbus
  git
  gobject-introspection
  meson
)
checkdepends=(
  gtk3
  gtk4
  weston
)
provides=(libgjs.so)
source=("git+https://gitlab.gnome.org/GNOME/gjs.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/gobject-introspection-tests.git")
sha256sums=('afd8118c108fe8b46690edd80a9b180f2cac88a9beb03eb73f91b89d0d37b8f2'
            'SKIP')

prepare() {
  cd gjs

  git submodule init
  git submodule set-url subprojects/gobject-introspection-tests "${srcdir}/gobject-introspection-tests"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
  local meson_options=(
    -D installed_tests=false
    -D profiler=disabled
  )

  ewe-meson gjs build "${meson_options[@]}"
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  # GDK_IS_SEAT: https://github.com/swaywm/wlroots/issues/103 needs implementation
  # text encoding
  dbus-run-session \
    meson test -C build --print-errorlogs || :
}

package() {
  depends+=(libreadline.so)
  meson install -C build --destdir "$pkgdir"
}
