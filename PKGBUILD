# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairo
pkgver=1.17.8
pkgrel=2
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64 aarch64)
license=(LGPL MPL)
source=(
  "https://gitlab.freedesktop.org/cairo/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
  "https://gitlab.freedesktop.org/cairo/cairo/-/merge_requests/442.patch"
)
depends=(libpng fontconfig pixman glib)
makedepends=(meson)
sha256sums=('b4ed6d33037171d4c6594345b42d81796f335a6995fdf5638db0d306c17a0d3e'
  'cc0535d5dce572d2d05da7036a7c82365e00eade95f43df9775b1a952d5c6ff8')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/442.patch
}

build()
{
  ewe-meson ${pkgname}-${pkgver} build \
    -D spectre=disabled \
    -D tee=enabled \
    -D tests=disabled \
    -D symbol-lookup=disabled \
    -D gtk_doc=false \
    -D xlib=disabled \
    -D xcb=disabled
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
