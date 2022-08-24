# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=skalibs
pkgver=2.12.0.1
pkgrel=1
pkgdesc='A library suite supporting skarnet.org software.'
arch=(x86_64)
url=http://skarnet.org/software/skalibs/
license=(ISC)
groups=()
depends=()
makedepends=()
options=()

source=(
    "http://skarnet.org/software/skalibs/skalibs-${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)

build() {
    cd ${pkgname}-${pkgver}
    ./configure \
      --prefix=/usr \
      --enable-force-devr \
      --enable-tai-clock
    make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" PREFIX=/usr install
}
