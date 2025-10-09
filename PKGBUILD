# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xkeyboard-config
pkgver=2.46
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('python' 'meson')
_dirname=xkeyboard-config-$pkgname-$pkgver
source=("$url/-/archive/$pkgname-$pkgver/xkeyboard-config-$pkgname-$pkgver.tar.gz")
sha256sums=('81107e12f71087b3f1d7dea43c186805d46abaffead0cafca9bdd24b94c2007e')

build() {
  ewe-meson $_dirname build \
	-D xkb-base="/usr/share/X11/xkb"
  meson configure build
  ninja -C build
 }
 
package() { 
  DESTDIR=$pkgdir ninja -C build install
  install -m755 -d ${pkgdir}/var/lib/xkb
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 $_dirname/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}

