# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer

pkgname=libnftnl
pkgver=1.2.7
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem'
arch=(x86_64 aarch64 riscv64)
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('libmnl')
checkdepends=('jansson')
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.xz")
sha256sums=('9122774f968093d5c0bacddd67de480f31fa4073405a7fc058a34b0f387aecb3')

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
