# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xkeyboard-config
pkgver=2.44
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('python' 'meson')
_dirname=xkeyboard-config-$pkgname-$pkgver
source=("$url/-/archive/$pkgname-$pkgver/xkeyboard-config-$pkgname-$pkgver.tar.gz")
sha256sums=('b617b23234bc75cd838c9fee8b5101cbf81d57a1851dc7fbeadabc11ba6d254e')

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

