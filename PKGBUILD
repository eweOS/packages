# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=bash
pkgver=5.1.16
pkgrel=1
pkgdesc='The GNU Bourne Again shell'
arch=(x86_64)
license=(GPL3)
groups=(base)
depends=(readline ncurses)
provides=('sh')
source=(
    "http://ftp.gnu.org/gnu/bash/${pkgname}-${pkgver}.tar.gz"
    bashrc
)

sha256sums=(
    'SKIP'
    'SKIP'
)

build() {
    cd ${pkgname}-${pkgver}
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --without-bash-malloc \
        --with-installed-readline
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    install -d "${pkgdir}/etc/"
    install -m 0644 "${srcdir}/bashrc" "${pkgdir}/etc/"
    cd ${pkgdir}/usr/bin
    ln -s bash sh
}
