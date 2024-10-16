# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=librest
pkgname=(librest librest-docs librest-demos)
pkgver=0.9.1
pkgrel=1
pkgdesc="Library for accessing RESTful web services"
url="https://gitlab.gnome.org/GNOME/librest"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(glib2 libxml2 libsoup3 json-glib)
makedepends=(gobject-introspection git meson gi-docgen vala libadwaita
             gtksourceview5)
source=("git+https://gitlab.gnome.org/GNOME/librest.git#tag=$pkgver"
        30.patch)
sha256sums=('50243b25c1b2197d4b787f5700db8959a00b590f719d22afa4c8e5a5f80a5142'
            'eb6cda2602b5d54eec6e3eb924a795f63e0b099b6c8452a393c4829747ae746f')

prepare() {
  cd librest

  # https://bugs.archlinux.org/task/76560
  # https://gitlab.gnome.org/GNOME/librest/-/merge_requests/30
  git apply -3 ../30.patch
}

build() {
  ewe-meson librest build -D vapi=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_librest() {
  depends+=(libg{lib,object,io}-2.0.so libxml2.so libsoup-3.0.so
            libjson-glib-1.0.so)
  provides+=(librest{,-extras}-1.0.so)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick_ docs usr/share/doc

  _pick_ demo usr/bin/librest-demo
  _pick_ demo usr/share/applications/org.gnome.RestDemo.desktop
}

package_librest-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv pkgs/docs/* "$pkgdir"
}

package_librest-demos() {
  pkgdesc+=" (demo applications)"
  depends=(librest libadwaita gtksourceview5)
  mv pkgs/demo/* "$pkgdir"
}
