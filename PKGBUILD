# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=make
pkgver=4.3
pkgrel=1
arch=(x86_64)
license=(GPL3)
groups=(base-devel)
depends=()
makedepends=(make)

source=(
    "http://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)


build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr --disable-nls 
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}" install
}
