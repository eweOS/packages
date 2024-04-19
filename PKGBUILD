# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer

pkgname=libnftnl
pkgver=1.2.6
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem'
arch=(x86_64 aarch64 riscv64)
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('libmnl')
checkdepends=('jansson')
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.xz")
sha256sums=('ceeaea2cd92147da19f13a35a7f1a4bc2767ff897e838e4b479cf54b59c777f4')

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  cd $pkgname-$pkgver/tests
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
