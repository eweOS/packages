# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=json-glib
pkgname=(
  json-glib
  json-glib-docs
)
pkgver=1.10.0
pkgrel=2
pkgdesc="JSON library built on GLib"
url="https://wiki.gnome.org/Projects/JsonGlib"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(glib)
makedepends=(
  docbook-xsl
  gi-docgen
  git
  gobject-introspection
  meson
  python-docutils
)
source=("https://gitlab.gnome.org/GNOME/$pkgbase/-/archive/$pkgver/$pkgbase-$pkgver.tar.gz")
sha256sums=('447890f9de2a04c312871768208f6c8aeec4069392af7605bc77e61165dcb374')

build()
{
  local meson_options=(
    -D installed_tests=false
    -D man=true
  )

  ewe-meson $pkgname-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}


package_json-glib() {
  depends+=(libg{lib,object,io}-2.0.so)
  provides+=(libjson-glib-1.0.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_json-glib-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
