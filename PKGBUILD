# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libnfnetlink
pkgver=1.0.2
pkgrel=1
pkgdesc='Low-level library for netfilter related kernel/userspace communication'
arch=(x86_64 aarch64 riscv64)
url='https://www.netfilter.org/projects/libnfnetlink/'
license=('GPL')
depends=('musl')
source=("https://www.netfilter.org/projects/$pkgname/files/$pkgname-$pkgver.tar.bz2")
sha256sums=('b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376')

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
