# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.27
pkgver="${_major_minor}.7"
pkgrel=0
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=(x86_64 aarch64 riscv64)
url='https://cmake.org'
license=('GPL2')

source=(
  "${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e')


build()
{
  cd ${pkgname}-${pkgver}
  ./bootstrap --prefix=/usr
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
