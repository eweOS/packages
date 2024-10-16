# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=librttopo
pkgver=1.1.0
pkgrel=1
pkgdesc="RT Topology Library"
arch=(x86_64 aarch64 riscv64)
url="https://git.osgeo.org/gitea/rttopo/librttopo"
license=(GPL2)
depends=(geos)
source=(https://git.osgeo.org/gitea/rttopo/$pkgname/archive/$pkgname-$pkgver.tar.gz
        postgis-15444-security-fix.patch)
sha256sums=('60b49acb493c1ab545116fb0b0d223ee115166874902ad8165eb39e9fd98eaa9'
            '1484abff57b0dc6767b5093611c46dfb1115d61ff65a3c06967d5a3671e17c85')

prepare() {
  cd $pkgname
  patch -p1 < ../postgis-15444-security-fix.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}
