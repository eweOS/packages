# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glib
pkgver=2.78.1
_pkgver_major=${pkgver%.*}
pkgrel=1
pkgdesc="Low-level core library that forms the basis for projects such as GTK+ and GNOME"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64 aarch64 riscv64)
depends=(pcre2 libffi util-linux-libs zlib)
makedepends=(gettext python libelf util-linux meson dbus)
source=("https://download.gnome.org/sources/$pkgname/${_pkgver_major}/$pkgname-$pkgver.tar.xz")
sha256sums=('915bc3d0f8507d650ead3832e2f8fb670fce59aac4d7754a7dab6f1e6fed78b2')

build()
{
  ewe-meson $pkgname-$pkgver build \
    --default-library both \
    -D glib_debug=disabled \
    -D selinux=disabled \
    -D sysprof=disabled \
    -D libmount=disabled \
    -D gtk_doc=false \
    -D tests=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
