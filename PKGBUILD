# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=autoconf-archive
pkgver=2022.09.03
pkgrel=1
epoch=1
pkgdesc="A collection of freely re-usable Autoconf macros"
arch=('any')
url="https://www.gnu.org/software/autoconf-archive/"
license=('GPL3')
depends=('autoconf')
optdepends=('automake: macros for use with it')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
