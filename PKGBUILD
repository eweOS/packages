# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib
pkgver=2.75.2
pkgrel=1
pkgdesc="Low-level core library that forms the basis for projects such as GTK+ and GNOME"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64 aarch64)
depends=(pcre2 libffi util-linux-libs zlib)
makedepends=(gettext python libelf util-linux meson dbus)
source=("https://download.gnome.org/sources/$pkgname/2.75/$pkgname-$pkgver.tar.xz")
sha256sums=('SKIP')

build()
{
  ewe-meson $pkgname-$pkgver build \
    --default-library both \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D sysprof=disabled \
    -D libmount=disabled \
    -D man=false \
    -D gtk_doc=false \
    -D tests=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
