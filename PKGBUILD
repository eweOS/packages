# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=1.8.0
pkgrel=1
pkgdesc='An API-driven pkg-config replacement'
arch=(x86_64)
url='https://github.com/pkgconf/pkgconf'
license=(BSD)
groups=(base-devel)
depends=(musl)
makedepends=()

source=(
    "https://distfiles.dereferenced.org/pkgconf/pkgconf-${pkgver}.tar.xz"
)

sha256sums=(
    'SKIP'
)


build() {
    cd ${pkgname}-${pkgver}
    ./configure \
      --prefix=/usr \
      --with-system-libdir=/usr/lib \
      --with-system-includedir=/usr/include
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    ln -s pkgconf "${pkgdir}/usr/bin/pkg-config"
}
