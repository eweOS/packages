# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xkeyboard-config
pkgver=2.47
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('python' 'meson')
_dirname=xkeyboard-config-$pkgname-$pkgver
source=("$url/-/archive/$pkgname-$pkgver/xkeyboard-config-$pkgname-$pkgver.tar.gz")
sha256sums=('b199d506aed1a03d00f11411091f6db8f136ef68f308d4747c76151e59cba874')

build() {
  ewe-meson $_dirname build \
    -D compat-rules=true
  meson configure build
  ninja -C build
 }
 
package() { 
  DESTDIR=$pkgdir ninja -C build install
  install -m755 -d ${pkgdir}/var/lib/xkb
  install -d $pkgdir/usr/share/licenses/$pkgname
  install -m644 $_dirname/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/
}

