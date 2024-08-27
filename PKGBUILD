# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blueprint-compiler
pkgver=0.14.0
pkgrel=1
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=(LGPL)
arch=(any)
depends=(python-gobject)
makedepends=(meson)
source=(https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v$pkgver/blueprint-compiler-v$pkgver.tar.gz)
sha256sums=('05faf3810cb76d4e2d2382c6a7e6c8096af27e144e2260635c97f6a173d67234')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
