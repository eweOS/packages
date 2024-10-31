# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=glib
pkgname=(
  glib
  glib-docs
  glib-static
)
pkgver=2.82.2
_pkgver_major=${pkgver%.*}
pkgrel=1
pkgdesc="Low-level core library that forms the basis for projects such as GTK+ and GNOME"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(pcre2 libffi util-linux-libs zlib)
makedepends=(gettext python libelf util-linux meson dbus gi-docgen
	     python-packaging python-docutils gobject-introspection
	     libffi-static pcre2-static)
# static libraries are added to silent namcap errors
source=(
  "https://download.gnome.org/sources/$pkgname/${_pkgver_major}/$pkgname-$pkgver.tar.xz"
  glib-compile-schemas.hook
  gio-querymodules.hook
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
)
sha256sums=('ab45f5a323048b1659ee0fbda5cecd94b099ab3e4b9abf26ae06aeb3e781fd63'
            'e42404979cc47959a3e560bf6f6c52b9fc90e1566ebb9b5cafb29d7f4cb4fe5f'
            'dea9edd111ba231f925b92e86e1cad06af92dc6ac306df4ad60182cc4d18ef59'
            '7f8ee5db60987f0d0feba84643e1cf988c98a294a681fb8d4fce1a5b2c25d1d3')

prepare()
{
  _patch_ $pkgname-$pkgver
}

build()
{
  ewe-meson $pkgname-$pkgver build \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D sysprof=disabled \
    -D libmount=disabled \
    -D gtk_doc=false \
    -D man-pages=enabled \
    -D documentation=true \
    -D systemtap=disabled \
    -D dtrace=disabled \
    -D tests=false

  ewe-meson $pkgname-$pkgver build-static \
    --default-library static \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D sysprof=disabled \
    -D libmount=disabled \
    -D gtk_doc=false \
    -D man-pages=disabled \
    -D documentation=false \
    -D systemtap=disabled \
    -D dtrace=disabled \
    -D tests=false

  meson compile -C build
  meson compile -C build-static
}

package_glib()
{
  provides+=(libg{lib,io,irepository,module,object,thread}-2.0.so)
  provides+=(glib2)
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  touch "$pkgdir/usr/lib/gio/modules/.keep"

  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  cd "$pkgdir"
  _pick_ docs usr/share/doc
}

package_glib-docs()
{
  pkgdesc+=" - documentation"
  depends=()
  options=(!strip)
  license+=(LicenseRef-Public-Domain)
  provides+=(glib2-docs)
  mv $srcdir/pkgs/docs/* "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $srcdir/$pkgbase-$pkgver/docs/reference/COPYING
}

package_glib-static() {
  pkgdesc+=" - static library"
  depends=(glib="$pkgver-$pkgrel" libffi-static pcre2-static)
  options=(staticlibs !strip)

  meson install -C build-static --destdir "$srcdir/static-install"
  install -Dm644 "$srcdir/static-install/usr/lib"/lib*.a -t "$pkgdir"/usr/lib
}
