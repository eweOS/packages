# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=door-knocker
pkgver=0.8.0
pkgrel=2
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=(GPL-3.0-or-later)
depends=('glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('221777e3dd58064eea6048e65cf6d53fa9d6577639a68d709e4a6ad46d025d24')

build() {
  ewe-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
