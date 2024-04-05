# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.29
pkgver="${_major_minor}.1"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=(x86_64 aarch64 riscv64)
url='https://cmake.org'
license=('GPL2')

source=(
  "${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('7fb02e8f57b62b39aa6b4cf71e820148ba1a23724888494735021e32ab0eefcc')


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
