# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.8.1.1
pkgrel=1
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL2')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('musl' 'readline' 'openssl')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f68b602c80e94b4b7498d74ec408785536fe33534b39467977a82ab2f7f01ddb')

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
