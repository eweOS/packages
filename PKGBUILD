# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blueprint-compiler
pkgver=0.20.4
pkgrel=1
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=(LGPL)
arch=(any)
depends=(python-gobject)
makedepends=(meson)
source=(https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v$pkgver/blueprint-compiler-v$pkgver.tar.gz)
sha256sums=('6f0f72fbce0919045047f30b56590e71cd82c66b890c37fe765a40494fd34feb')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
