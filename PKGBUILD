# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
pkgname=(curl ca-certs)
pkgver=8.23.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://curl.haxx.se'
license=('MIT')
depends=('musl' 'openssl' 'zlib' 'zstd' 'libpsl')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e05a7728b24b6d3dffab3e8dd50031e36412132945c5997413f7dae2b2fa3854f07c0f2f28d8251536776f8f2df42ed221d32cce07bb72d28f24fafb8110166b')

prepare() {
  _patch_ "$pkgbase-$pkgver"
}

build() {
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

package_curl() {
  provides=('libcurl.so')
  cd build-curl
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install -C scripts
}

package_ca-certs() {
  depends=()

  cd "${srcdir}/curl-${pkgver}"
  ./scripts/mk-ca-bundle.pl
  install -d "${pkgdir}/etc/ssl/certs"
  install -m0644 ca-bundle.crt "${pkgdir}/etc/ssl/certs/ca-certificates.crt"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/cert.pem"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/ca-certs.pem"
}
