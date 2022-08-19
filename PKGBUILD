# Maintainer: Username <i@example.com>

pkgname=
pkgver=
pkgrel=1
pkgdesc=''
arch=('x86_64')
license=('')
depends=()
makedepends=()
options=()
source=()
sha256sums=()

build() {
  cd $pkgname-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
