# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib
pkgver=2.81.0
_pkgver_major=${pkgver%.*}
pkgrel=2
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
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
)
sha256sums=('1665188ed9cc941c0a189dc6295e6859872523d1bfc84a5a84732a7ae87b02e4'
            'e42404979cc47959a3e560bf6f6c52b9fc90e1566ebb9b5cafb29d7f4cb4fe5f'
            '7f8ee5db60987f0d0feba84643e1cf988c98a294a681fb8d4fce1a5b2c25d1d3')

prepare()
{
  _patch_ $pkgname-$pkgver
}

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
    -D systemtap=disabled \
    -D dtrace=disabled \
    -D tests=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
}
