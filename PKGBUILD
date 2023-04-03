# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attr
pkgver=2.5.1
pkgrel=1
pkgdesc='Extended attribute support library for ACL support'
arch=('x86_64' 'aarch64')
license=('LGPL')
depends=(musl)
makedepends=('gettext')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('db448a626f9313a1a970d636767316a8da32aede70518b8050fa0de7947adc32')

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
