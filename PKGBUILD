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
# 0001: Backport, 2637791eb1e1 ("mk-ca-bundle.pl: add -x option to exclude specific CA roots")
#	modified slightly to apply on 8.23.0
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz"
	0001-mk-ca-bundle-pl-add-x-option-to-exclude.patch)
sha512sums=('e05a7728b24b6d3dffab3e8dd50031e36412132945c5997413f7dae2b2fa3854f07c0f2f28d8251536776f8f2df42ed221d32cce07bb72d28f24fafb8110166b'
            'c56bbbe7d15016bb928f3d26fa1642c1d1d6220e17cfd0af4c9fd34aa128a0c914237a0138373869e733be6a2c0e9d4d75f04f8fba7b2d4d171ced3d81537de8')

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
  # Exclude the leaked emSign certificates
  # "emSign ECC Root CA - G3"
  # "emSign Root CA - C1"
  # "emSign ECC Root CA - C3"
  ./scripts/mk-ca-bundle.pl -x '125609AA301DA0A249B97A8239CB6A34216F44DCAC9F3954B14292F2E8C8608F,BC4D809B15189D78DB3E1D8CF4F9726A795DA1643CA5F1358E1DDB0EDC0D7EB3,86A1ECBA089C4A8D3BBE2734C612BA341D813E043CF9E8A862CD5C57A36BBE6B'
  install -d "${pkgdir}/etc/ssl/certs"
  install -m0644 ca-bundle.crt "${pkgdir}/etc/ssl/certs/ca-certificates.crt"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/cert.pem"
  ln -s certs/ca-certificates.crt "${pkgdir}/etc/ssl/ca-certs.pem"
}
