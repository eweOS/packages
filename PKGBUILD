# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blueprint-compiler
pkgver=0.18.0
pkgrel=1
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=(LGPL)
arch=(any)
depends=(python-gobject)
makedepends=(meson)
source=(https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v$pkgver/blueprint-compiler-v$pkgver.tar.gz)
sha256sums=('703c7ccd23cb6f77a8fe9c8cae0f91de9274910ca953de77135b6e79dbff1fc3')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
