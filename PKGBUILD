# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=libmnl
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimalistic user-space library oriented to Netlink developers.'
arch=(x86_64 aarch64)
url='https://www.netfilter.org/projects/libmnl/'
license=('LGPL2.1')
depends=('musl' 'sys-queue.h')
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"
  musl-fix-headers.patch)
sha256sums=('SKIP' 'SKIP')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/musl-fix-headers.patch
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  cd $pkgname-$pkgver
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
