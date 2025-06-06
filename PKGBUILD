# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.4.0
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=(libskarnet.so)
url=http://skarnet.org/software/skalibs/
license=(ISC)

source=(
  "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=('0e626261848cc920738f92fd50a24c14b21e30306dfed97b8435369f4bae00a5')

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
