# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
pkgname=(curl ca-certs)
pkgver=8.21.0
pkgrel=2
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://curl.haxx.se'
license=('MIT')
depends=('musl' 'openssl' 'zlib' 'zstd' 'libpsl')
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('1a1c88d7e52200d0a8879f61868accd7eb7edacb730e09db8e1f741535e9906005c897c2ce39b562c20e1b3ef2c84512f5b4fda9aa50c67e2364c473d15a1f65')

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
  cd "${srcdir}/curl-${pkgver}"
  ./scripts/mk-ca-bundle.pl
  install -d "${pkgdir}/etc/ssl/certs"
  install -m0644 ca-bundle.crt "${pkgdir}/etc/ssl/certs/ca-certificates.crt"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/cert.pem"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/ca-certs.pem"
}
