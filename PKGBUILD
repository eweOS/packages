# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.24
pkgver="${_major_minor}.1"
pkgrel=1
pkgdesc='The CMake toolsuite for building, testing and packaging software.'
arch=('x86_64')
url='https://cmake.org'
license=('GPL2')
groups=()
depends=()
makedepends=()
options=()

source=(
    "${url}/files/v${_major_minor}/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=('SKIP')


build() {
    cd ${pkgname}-${pkgver}
    ./bootstrap --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

