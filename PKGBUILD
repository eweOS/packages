# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blueprint-compiler
pkgver=0.22.2
pkgrel=1
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=(LGPL)
arch=(any)
depends=(python-gobject)
makedepends=(meson)
source=(https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v$pkgver/blueprint-compiler-v$pkgver.tar.gz)
sha256sums=('ba4dddeb22a1929ed5987e74cb69c592e22bc74f0c04cfdb9028b907cf688af6')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
