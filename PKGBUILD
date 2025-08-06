# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer

pkgname=libnftnl
pkgver=1.3.0
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://netfilter.org/projects/libnftnl/'
license=('GPL-2.0-or-later')
depends=('libmnl')
makedepends=('linux-headers' 'autoconf')
checkdepends=('jansson')
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.xz")
sha256sums=('0f4be47a8bb8b77a350ee58cbd4b5fae6260ad486a527706ab15cfe1dd55a3c4')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

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
