# Maintainer: Aleksana QwQ
pkgname=musl-obstack
pkgver=1.2.3
pkgrel=1
pkgdesc="Standalone library to implement GNU libc's obstack"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/void-linux/musl-obstack"
license=('LGPL')
depends=('musl')
makedepends=('automake' 'autoconf' 'libtool')
source=("${pkgname}-${pkgver}"::"https://github.com/void-linux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b2bbed19c4ab2714ca794bdcb1a84fad1af964e884d4f3bbe91c9937ca089d92b8472cb05ebe998a9f5c85cb922b9b458db91eff29077bd099942e1ce18e16cc')

prepare()
{
  cd ${pkgname}-${pkgver}
  ./bootstrap.sh
}

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
}
