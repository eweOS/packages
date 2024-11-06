# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
# Temporary add ca certs
pkgname=(curl ca-certs)
pkgver=8.11.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://curl.haxx.se'
license=('MIT')
depends=('openssl' 'zlib')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b1dc36cfb40188d3a0f58d41968f69134e53803075b250e3e31579b8f680d9a083f3ad8f10c886a94fcd1b9b92873530ba6f73ca6ea41bbe07cb59d00918b066')

build()
{
  mkdir build-curl
  cd "${srcdir}"/build-curl
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix='/usr' \
    --with-ssl \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --without-libpsl
  make
}

package_curl()
{
  provides=('libcurl.so')
  cd build-curl
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C scripts
}

package_ca-certs()
{
  cd "${srcdir}/curl-${pkgver}"
  ./scripts/mk-ca-bundle.pl
  install -d "${pkgdir}/etc/ssl/certs"
  install -m0644 ca-bundle.crt "${pkgdir}/etc/ssl/certs/ca-certificates.crt"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/cert.pem"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/ca-certs.pem"
}
