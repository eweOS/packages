# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cmake
_major_minor=3.21
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
sha256sums=(
    fac3915171d4dff25913975d712f76e69aef44bf738ba7b976793a458b4cfed4
)


build() {
    cd ${pkgname}-${pkgver}
    ./bootstrap --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}

