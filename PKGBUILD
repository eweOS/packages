# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shared-mime-info
pkgver=2.2
pkgrel=2
pkgdesc="Shared MIME Info"
arch=('x86_64' 'aarch64')
license=('GPL2')
depends=('libxml2' 'glib')
makedepends=('gettext' 'meson')
url="https://www.freedesktop.org/wiki/Specifications/$pkgname-spec/"
source=("https://gitlab.freedesktop.org/xdg/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')
options=(!makeflags)

build() {
  ewe-meson $pkgname-$pkgver build
  meson configure build
  ninja -C build 
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
