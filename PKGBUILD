# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.26
pkgver="${_major_minor}.2"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=('x86_64' 'aarch64')
url='https://cmake.org'
license=('GPL2')

source=(
  "${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('d54f25707300064308ef01d4d21b0f98f508f52dda5d527d882b9d88379f89a8')

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
