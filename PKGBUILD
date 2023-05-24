# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=acl
pkgver=2.3.1
pkgrel=2
pkgdesc='Access control list utilities, libraries and headers'
arch=('x86_64' 'aarch64')
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL')
depends=('attr')
options=('debug')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af')

build()
{
  cd $pkgname-$pkgver
  # Add D_LARGEFILE64_SOURCE to avoid imcomplete type for musl 1.2.4
  CFLAGS="$CFLAGS -D_LARGEFILE64_SOURCE" ./configure \
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
