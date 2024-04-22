# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.29
pkgver="${_major_minor}.2"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=(x86_64 aarch64 riscv64)
makedepends=(linux-headers)
url='https://cmake.org'
license=('GPL2')
source=("${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('36db4b6926aab741ba6e4b2ea2d99c9193222132308b4dc824d4123cb730352e')

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
