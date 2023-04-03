# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=musl-fts
pkgver=1.2.7
pkgrel=1
pkgdesc="Standalone library to implement GNU libc's fts"
arch=('x86_64' 'aarch64')
url="https://github.com/void-linux/musl-fts"
license=('LGPL')
depends=('musl')
makedepends=('automake' 'autoconf' 'libtool')
source=("${pkgname}-${pkgver}"::"https://github.com/void-linux/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('949f73b9406b06bd8712c721b4ec89afcb37d4eaef5666cccf3712242d3a57fc0acf3ca994934e0f57c1e92f40521a9370132a21eb6d1957415a83c76bf20feb')

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
