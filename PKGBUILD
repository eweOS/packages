# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=blueprint-compiler
pkgver=0.16.0
pkgrel=1
pkgdesc='A markup language for GTK user interfaces'
url='https://jwestman.pages.gitlab.gnome.org/blueprint-compiler/'
license=(LGPL)
arch=(any)
depends=(python-gobject)
makedepends=(meson)
source=(https://gitlab.gnome.org/jwestman/blueprint-compiler/-/archive/v$pkgver/blueprint-compiler-v$pkgver.tar.gz)
sha256sums=('01feb8263fe7a450b0a9fed0fd54cf88947aaf00f86cc7da345f8b39a0e7bd30')

build() {
  ewe-meson $pkgname-v$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
