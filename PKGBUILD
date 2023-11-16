# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cairo
pkgver=1.18.0
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
sha256sums=('39a78afdc33a435c0f2ab53a5ec2a693c3c9b6d2ec9783ceecb2b94d54d942b0')

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
