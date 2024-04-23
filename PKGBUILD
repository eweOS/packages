# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=json-glib
pkgver=1.8.0
pkgrel=1
pkgdesc="JSON library built on GLib"
url="https://wiki.gnome.org/Projects/JsonGlib"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(glib)
makedepends=(gobject-introspection meson)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('97bc058fad49ebf5195ec539240370454ef6589d2b97bf626d7a9e2353d25e3f')

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D gtk_doc=disabled
  meson compile -C build
}

# Disable check tempoary due to error in #14 node
#check() {
#  meson test -C build --print-errorlogs
#}

package()
{
  meson install -C build --destdir "$pkgdir"
}
