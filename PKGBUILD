# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.2.0
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64)
provides=(libskarnet.so)
url=http://skarnet.org/software/skalibs/
license=(ISC)

source=(
  "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=('ddfec5730e5b2f19d0381ecf7f796b39a6e473236bda0ad8d3776a3fe7b07e43')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-force-devr \
    --enable-tai-clock
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}
