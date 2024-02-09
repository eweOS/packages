# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=acl
pkgver=2.3.2
pkgrel=1
pkgdesc='Access control list utilities, libraries and headers'
arch=(x86_64 aarch64 riscv64)
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL')
depends=('attr')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c')

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
