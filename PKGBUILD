# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.5.1
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(musl)
provides=(libskarnet.so)
url='http://skarnet.org/software/skalibs/'
license=(ISC)
source=("http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz")
sha256sums=('fa359c70439b480400a0a2ef68026a2736b315025a9d95df69d34601fb938f0f')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-force-devr \
    --enable-tai-clock \
    --enable-pkgconfig
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  _install_license_ COPYING
}
