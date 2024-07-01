# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=json-glib
pkgver=1.9.2
pkgrel=1
pkgdesc="JSON library built on GLib"
url="https://wiki.gnome.org/Projects/JsonGlib"
arch=(x86_64 aarch64 riscv64)
license=(GPL)
depends=(glib)
makedepends=(gobject-introspection meson)
source=("https://gitlab.gnome.org/GNOME/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('277c3b7fc98712e30115ee3a60c3eac8acc34570cb98d3ff78de85ed804e0c80')

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
