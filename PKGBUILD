# Maintainer:Yukari Chiba <i@0x7f.cc>

pkgname=gperf
pkgver=3.1
pkgrel=1
pkgdesc="Perfect hash function generator"
arch=(x86_64 aarch64)
url="https://www.gnu.org/software/gperf/"
license=('GPL3')
depends=('llvm-libs')
source=("https://ftp.gnu.org/pub/gnu/gperf/${pkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
