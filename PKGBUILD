# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
# Temporary add ca certs
pkgname=(curl ca-certs)
pkgver=7.79.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=('x86_64')
url='https://curl.haxx.se'
license=('MIT')
depends=('openssl' 'zlib')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('SKIP')

build() {
    mkdir build-curl
    cd "${srcdir}"/build-curl
    "${srcdir}/${pkgbase}-${pkgver}"/configure \
        --prefix='/usr' \
        --with-ssl \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
    make
}

package_curl() {
    cd build-curl
    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" install -C scripts
}

package_ca-certs() {
    cd "${srcdir}/curl-${pkgver}"
    ./lib/mk-ca-bundle.pl
    install -d "${pkgdir}/etc/ssl/certs"
    install -m0644 ca-bundle.crt "${pkgdir}/etc/ssl/certs/ca-certificates.crt"
    ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/cert.pem"
    ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/ca-certs.pem"
}
