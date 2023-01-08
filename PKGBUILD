# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=acl
pkgver=2.3.1
pkgrel=1
pkgdesc='Access control list utilities, libraries and headers'
arch=('x86_64' 'aarch64')
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL')
depends=('attr')
options=('debug')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
