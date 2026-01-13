# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.5.0
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(musl)
provides=(libskarnet.so)
url='http://skarnet.org/software/skalibs/'
license=(ISC)
source=("http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz")
sha256sums=('d8d9ec756b112ab6d4a9896ba0f53aca92559bc90aeaccd53ed8177e6e159764')

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
