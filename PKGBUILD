# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=attr
pkgver=2.6.0
pkgrel=1
pkgdesc='Extended attribute support library for ACL support'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LGPL-2.1-or-later AND GPL-2.0-or-later')
url='https://savannah.nongnu.org/projects/attr'
makedepends=('gettext' 'linux-uapi-headers')
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6c8a2148a7b85043b68492bce43316b0e2e214fc4e628c7ede078e76e216330b')

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
