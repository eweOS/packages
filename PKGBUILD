# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.8.1.3
pkgrel=2
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL-2.0-only')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('musl' 'readline' 'openssl')
# 0001: Should be upstreamed, GENERAL_NAME.ipAddress has type ASN1_OCTET_STRING,
#	which is typedef'ed as ASN1_STRING, and has becomed opaque since OpenSSL
#	4.0 and must be accessed with helpers.
source=("$url/download/${pkgname}-${pkgver}.tar.gz"
	"0001-socat-openssl4-fix.patch::https://www.linuxfromscratch.org/slfs/view/13.1/download/socat/socat-1.8.1.3-openssl4_fixes-1.patch")
sha256sums=('06602ffd591e98c75b3dc1d66f0f19136cc666b0b2d95caad987d6ab2cb28097'
            '7f2827c929bbd1441893780c35c929dd3631cd19a8fa14e993a3e8b10e63c2c2')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
