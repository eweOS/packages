# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-shell
pkgver=0.11.0
pkgrel=1
pkgdesc='GTK4-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(alsa-lib gtk4-layer-shell gtkmm hicolor-icon-theme libdbusmenu-glib libdrm libepoxy libpulse libwireplumber libxkbcommon mesa openssl pam wf-config yyjson)
makedepends=(wayland wayfire wayland-protocols meson ninja git gobject-introspection glib2 glm libpipewire wlroots0.20-devel)
backup=(etc/pam.d/wf-locker etc/xdg/xdg-desktop-portal-wlr/wayfire)
# 0001: Downstream, clang cannot use WfOption<T>'s deduced conversion operator
# inherited from a template base in a switch statement.
# TODO: upstream it.
source=(
  "${pkgname}::git+https://github.com/WayfireWM/wf-shell#tag=v$pkgver"
  git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git
  git+https://github.com/soreau/wayland-logout.git
  git+https://github.com/WayfireWM/wf-json.git
  "0001-locker-use-explicit-option-value-in-switch.patch"
)
sha512sums=('d8c19cc4828361c931cbcec529de539f00f8d248b13d64d10b3e2debddd4587a8bf6ad5ee388b630f4e512a5ad98638bb9df0fb9d96f75d81d28584935f237d4'
            'SKIP' 'SKIP' 'SKIP'
            'da68868bae632430a575bd814594daf19b3e5e8136bfaf9e36c24779a1c80c5c574d4a9832f5805d314b7dd07db508888c92dbfa5b5cd19bd7bd9d218e875834')

prepare() {
  cd "$pkgname"
  _patch_ "$pkgname"

  git submodule init
  git config submodule.subprojects/gtk4-layer-shell.update none
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule set-url subprojects/wayland-logout "$srcdir/wayland-logout"
  git submodule set-url subprojects/wf-json "$srcdir/wf-json"
  git -c protocol.file.allow=always submodule update
}

build() {
  # ddcutil is not packaged
  ewe-meson "$pkgname" build -Dddcutil=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  cd "$pkgname"
  _install_license_ "$srcdir/$pkgname/LICENSE" LICENSE
  install -Dm644 wf-shell.ini.example "$pkgdir/usr/share/doc/$pkgname/wf-shell.ini.example"
}
