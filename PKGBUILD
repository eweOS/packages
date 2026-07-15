# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=acl
pkgver=2.4.0
pkgrel=1
pkgdesc='Access control list utilities, libraries and headers'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL-2.1-or-later AND GPL-2.0-or-later')
depends=('attr')
makedepends=('linux-uapi-headers')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('73c853c3d44e1f693e5a96a986f1bd19d3d0dac2c7d453e796177774bc4e5f6a')

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
