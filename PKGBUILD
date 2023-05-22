# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=make
pkgver=4.4.1
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="GNU make utility to maintain groups of programs"
url="https://www.gnu.org/software/make"
license=(GPL3)
groups=(base-devel)
makedepends=(make)

source=(
  "http://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz"
)

sha256sums=('dd16fb1d67bfab79a72f5e8390735c49e3e8e70b4945a15ab1f81ddb78658fb3')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-nls
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
