# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairo
pkgver=1.18.2
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL MPL)
source=(
  "https://gitlab.freedesktop.org/cairo/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
)
depends=(libpng fontconfig pixman glib)
makedepends=(meson)
sha256sums=('7bbfb469b89b1f60584b4f39a1366789b7625a5796905870e108b6c0e8ca8216')

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
