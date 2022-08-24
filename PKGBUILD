# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=utmps
pkgver=0.1.2.0
pkgrel=1
pkgdesc='An implementation of the utmpx.h family of functions performing user accounting'
arch=(x86_64)
url='http://skarnet.org/software/utmps/'
license=(ISC)
groups=()
depends=(s6)
makedepends=(skalibs)
options=()

source=(
    "http://skarnet.org/software/utmps/utmps-${pkgver}.tar.gz"
    utmpd-service
    wtmpd-service
    utmps.install
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd ${pkgname}-${pkgver}
    ./configure \
        --prefix=/usr \
        --bindir=/sbin \
        --libdir=/usr/lib \
        --with-sysdeps=/lib/skalibs/sysdeps \
        --enable-libc-includes
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
    install -d "${pkgdir}/etc/s6/init-services/utmpd"
    install -m 0754 "${srcdir}/utmpd-service" "${pkgdir}/etc/s6/init-services/utmpd/run"
    echo 3 >"${pkgdir}/etc/s6/init-services/utmpd/notification-fd"
    install -d "${pkgdir}/etc/s6/init-services/wtmpd"
    install -m 0754 "${srcdir}/wtmpd-service" "${pkgdir}/etc/s6/init-services/wtmpd/run"
    echo 3 >"${pkgdir}/etc/s6/init-services/wtmpd/notification-fd"
}

