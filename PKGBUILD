# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xkeyboard-config
pkgver=2.49
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('python' 'meson')
_dirname=xkeyboard-config-$pkgname-$pkgver
source=("$url/-/archive/$pkgname-$pkgver/xkeyboard-config-$pkgname-$pkgver.tar.gz")
sha256sums=('deda99f75a41532db85661cac01793c9b48b5e68a78ecd259fe8b3a7d8fddd61')

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

