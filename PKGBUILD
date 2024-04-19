# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib
pkgver=2.80.0
_pkgver_major=${pkgver%.*}
pkgrel=1
pkgdesc="Low-level core library that forms the basis for projects such as GTK+ and GNOME"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64 aarch64 riscv64)
depends=(pcre2 libffi util-linux-libs zlib)
makedepends=(gettext python libelf util-linux meson dbus python-packaging gobject-introspection)
provides=(glib2)
source=(
  "https://download.gnome.org/sources/$pkgname/${_pkgver_major}/$pkgname-$pkgver.tar.xz"
  glib-compile-schemas.hook
)
sha256sums=('8228a92f92a412160b139ae68b6345bd28f24434a7b5af150ebe21ff587a561d'
            'e42404979cc47959a3e560bf6f6c52b9fc90e1566ebb9b5cafb29d7f4cb4fe5f')

build()
{
  ewe-meson $pkgname-$pkgver build \
    --default-library both \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D sysprof=disabled \
    -D libmount=disabled \
    -D gtk_doc=false \
    -D man-pages=disabled \
    -D tests=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}
