# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.7.4.4
pkgrel=1
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL2')
arch=(x86_64 aarch64 riscv64)
depends=('musl' 'readline' 'openssl')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0f8f4b9d5c60b8c53d17b60d79ababc4a0f51b3bb6d2bd3ae8a6a4b9d68f195e')

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
