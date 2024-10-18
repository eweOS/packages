# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.3.0
pkgrel=2
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64 loongarch64)
provides=(libskarnet.so)
url=http://skarnet.org/software/skalibs/
license=(ISC)

source=(
  "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=('a14aa558c9b09b062fa16acec623b2c8f93d69f5cba4d07f6d0c58913066c427')

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
