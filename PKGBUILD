# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jade-gui
pkgver=1.9.4
_pkgver=1.9.4
pkgrel=1
pkgdesc='Libadwaita based GUI front-end for Jade'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/eweOS/$pkgname"
depends=('openssl' 'libadwaita' 'python-pytz' 'vte4' 'gtksourceview5' 'python-tzlocal')
makedepends=('meson' 'ninja' 'desktop-file-utils' 'appstream-glib' 'gtk4')
_refcommit=03cf282396b00bfaf2bd2b2b7b3831300a16c09a
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "$_pkgver.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  ewe-meson ${pkgname} build
  meson compile -C build
}

package() {
  depends+=('jade' 'gparted' 'python-gobject' 'python-requests')
  meson install -C build --destdir "$pkgdir"
}
