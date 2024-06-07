# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.29
pkgver="${_major_minor}.5"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=(x86_64 aarch64 riscv64)
depends=(openssl)
makedepends=(linux-headers)
url='https://cmake.org'
license=('GPL2')
source=("${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
	"detect-eweOS.patch")
sha256sums=('dd63da7d763c0db455ca232f2c443f5234fe0b11f8bd6958a81d29cc987dfd6e'
            '61399bb31861e501da22d520badafc0ba4a7d4bc742aaa3352539065943e93b1')

prepare() {
  _patch_ ${pkgname}-${pkgver}
}

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
