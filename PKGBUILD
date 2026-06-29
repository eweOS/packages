# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libportal
pkgname=(
  libportal
  libportal-docs
  libportal-gtk3
  libportal-gtk4
  libportal-qt6
)
pkgver=0.10.0
pkgrel=1
pkgdesc="GIO-style async APIs for most Flatpak portals"
url="https://github.com/flatpak/libportal"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-only)
makedepends=(
  gi-docgen
  git
  gjs
  glib2
  gobject-introspection
  gtk3
  gtk4
  meson
  qt6-base
  qt6-base-devel
  qt6-tools
  vala
)
checkdepends=(
  python-dbusmock
  python-pytest
  weston
  qt6-wayland
)
source=("git+https://github.com/flatpak/libportal#tag=$pkgver")
sha256sums=('17bff0c39b3dbf039abbba67fc2e43df405905032c0256d705bbef822ce27b23')

prepare() {
  cd libportal

  # Fix build against Qt 6.9
  git cherry-pick -n 796053d2eebe4532aad6bd3fd80cdf3b197806ec
}

build() {
  ewe-meson libportal build -D backend-qt5=disabled
  meson compile -C build
}

check() {
  export XDG_RUNTIME_DIR="$PWD/runtime-dir" WAYLAND_DISPLAY=wayland-5

  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  weston --backend=headless-backend.so --socket=$WAYLAND_DISPLAY --idle-time=0 &
  _w=$!

  trap "kill $_w; wait" EXIT

  meson test -C build --print-errorlogs
}

package_libportal() {
  depends=(
    glib2
    libg{lib,object,io}-2.0.so
  )
  optdepends=(
    'libportal-docs: API documentation'
    'libportal-gtk3: GTK 3 backend'
    'libportal-gtk4: GTK 4 backend'
    'libportal-qt6: Qt 6 backend'
    'xdg-desktop-portal: Portal service'
  )
  provides=(libportal.so)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ docs usr/share/doc

  local x
  for x in gtk3 gtk4 qt6; do
    _pick_ $x usr/include/libportal-$x
    _pick_ $x usr/lib{,/pkgconfig}/libportal-$x.*

    if [[ $x == gtk* ]]; then
      _pick_ $x {usr/lib/girepository-1.0,usr/share/gir-1.0}/Xdp${x^}-1.0.*
      _pick_ $x usr/share/vala/vapi/libportal-$x.*
    fi
  done
}

package_libportal-docs() {
  pkgdesc+=" - API documentation"

  mv pkgs/docs/* "$pkgdir"
}

package_libportal-gtk3() {
  pkgdesc+=" - GTK 3 backend"
  depends=(
    glib2
    gtk3
    libportal
  )
  provides=(libportal-gtk3.so)

  mv pkgs/gtk3/* "$pkgdir"
}

package_libportal-gtk4() {
  pkgdesc+=" - GTK 4 backend"
  depends=(
    glib2
    gtk4
    libportal
  )
  provides=(libportal-gtk4.so)

  mv pkgs/gtk4/* "$pkgdir"
}

package_libportal-qt6() {
  pkgdesc+=" - Qt 6 backend"
  depends=(
    glib2
    libportal
    qt6-base
  )
  provides=(libportal-qt6.so)

  mv pkgs/qt6/* "$pkgdir"
}
