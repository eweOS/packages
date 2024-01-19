# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attr
pkgver=2.5.2
pkgrel=1
pkgdesc='Extended attribute support library for ACL support'
arch=(x86_64 aarch64 riscv64)
license=('LGPL')
makedepends=('gettext')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f2e97b0ab7ce293681ab701915766190d607a1dba7fae8a718138150b700a70b')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
