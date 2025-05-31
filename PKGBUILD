# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=curl
pkgname=(curl ca-certs)
pkgver=8.14.0
pkgrel=1
pkgdesc='An URL retrieval utility and library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://curl.haxx.se'
license=('MIT')
depends=('musl' 'openssl' 'zlib' 'zstd')
# 0001: Backport, fix strange OOM errors when using multi interface
#	https://github.com/curl/curl/issues/17473
source=("https://curl.haxx.se/download/${pkgname}-${pkgver}.tar.gz"
	"0001-multi-fix-add_handle-resizing.patch::https://github.com/curl/curl/commit/d16ccbd55de80c271fe822f4ba8b6271fd9166ff.patch")
sha512sums=('05616987ef82abedc05f7446d06ce59c8c715152e205a78eb9613dd286bae767c166c56700cfe5329ff89dfdb243e49597bf7ef9481f863bd3283fcd8966a7ef'
            'e66cd85f563d28e3c1eb1e2c799bbd1108ca25e6d446c94f56f117fb37b08ecf67d766e00f14ca4f823dd01b93ac5d7d65421d5ff76ec4b4d96b005f5dfe120e')

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
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --without-libpsl
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
