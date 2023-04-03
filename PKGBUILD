# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairo
pkgver=1.17.8
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64 aarch64)
license=(LGPL MPL)
source=("https://gitlab.freedesktop.org/cairo/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
depends=(libpng fontconfig pixman glib)
makedepends=(meson)
sha256sums=('b4ed6d33037171d4c6594345b42d81796f335a6995fdf5638db0d306c17a0d3e')

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
