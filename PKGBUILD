# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.14.1.1
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64)
provides=(libskarnet.so)
url=http://skarnet.org/software/skalibs/
license=(ISC)

source=(
  "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=('b6b79b816f4ba0b6801676b0ed4179b59c8c7809eeffe26db672e404636befc3')

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
