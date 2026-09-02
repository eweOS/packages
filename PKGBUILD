# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
pkgname=(curl ca-certs)
pkgver=8.22.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://curl.haxx.se'
license=('MIT')
depends=('musl' 'openssl' 'zlib' 'zstd' 'libpsl')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ff7e7825d570333e211c8f68954cfd404f5abad62a7d6505504162a8bd9cb489f13a42da7507933eca55a2104cdb988dd0c65646535b429b03c279ef802963f5')

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
