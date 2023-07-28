# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer <seblu@archlinux.org>
# Contributor: Christian Hesse <mail@earthworm.de>

pkgname=libmnl
pkgver=1.0.5
pkgrel=1
pkgdesc='Minimalistic user-space library oriented to Netlink developers.'
arch=(x86_64 aarch64 riscv64)
url='https://www.netfilter.org/projects/libmnl/'
license=('LGPL2.1')
depends=('musl' 'sys-queue.h')
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2"
  musl-fix-headers.patch)
sha256sums=('274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525'
            'a9a082a4e48982d16eb4cff533061fd324de6bdc78f12eb497a0f7fa6c7d2969')

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
