# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
# Temporary add ca certs
pkgname=(curl ca-certs)
pkgver=8.4.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64)
url='https://curl.haxx.se'
license=('MIT')
depends=('openssl' 'zlib')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('375d241effccde852cfba32aa61be406f6c6e8ef2773b48d57bfa1ff99fdf414dc08bdb6b3a65930e53b28e31246a4bc396c81054ae9c560a3bf58cca0ae78b0')


build()
{
  mkdir build-curl
  cd "${srcdir}"/build-curl
  "${srcdir}/${pkgbase}-${pkgver}"/configure \
    --prefix='/usr' \
    --with-ssl \
    --enable-ipv6 \
    --enable-threaded-resolver \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package_curl()
{
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
