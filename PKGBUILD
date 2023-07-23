# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.27
pkgver="${_major_minor}.0"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=('x86_64' 'aarch64')
url='https://cmake.org'
license=('GPL2')

source=(
  "${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('aaeddb6b28b993d0a6e32c88123d728a17561336ab90e0bf45032383564d3cb8')

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
