# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=door-knocker
pkgver=0.9.0
pkgrel=1
pkgdesc="Check availability of all portals provided by xdg-desktop-portal"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://codeberg.org/tytan652/door-knocker"
license=(GPL-3.0-or-later)
depends=('glib2' 'hicolor-icon-theme' 'libadwaita' 'gtk4')
makedepends=('meson' 'blueprint-compiler')
source=(${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tytan652/door-knocker/archive/${pkgver}.tar.gz)
sha256sums=('c449959f8bd09431f8c3da8edae480ff24c67592f6c5ce7c87088e3668bf4d02')

build() {
  ewe-meson ${pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
