# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.12.0.1
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64 aarch64 riscv64)
url=http://skarnet.org/software/skalibs/
license=(ISC)

source=(
  "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=('3e228f72f18d88c17f6c4e0a66881d6d3779427b7e7e889f3142b6f26da30285')

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
