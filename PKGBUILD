# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=cairo
pkgname=(
  cairo
  cairo-docs
)
pkgver=1.18.4
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices"
url="https://cairographics.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL MPL)
source=(
  "https://gitlab.freedesktop.org/cairo/${pkgname}/-/archive/${pkgver}/${pkgbase}-${pkgver}.tar.gz"
)
depends=(libpng fontconfig pixman glib)
makedepends=(meson gtk-doc)
sha256sums=('2f3e6e665dbbb420809102b71ad7d0f7ce870a0b1bf8b34c073f06aefb511fc6')

build()
{
  ewe-meson ${pkgbase}-${pkgver} build \
    -D gtk_doc=true \
    -D spectre=disabled \
    -D tee=enabled \
    -D tests=disabled \
    -D symbol-lookup=disabled \
    -D xlib=disabled \
    -D xcb=disabled
  meson compile -C build
}

package_cairo()
{
  provides=(
    libcairo-gobject.so
    libcairo-script-interpreter.so
    libcairo.so
  )
  options+=(!emptydirs)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/gtk-doc
}

package_cairo-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
