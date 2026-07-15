# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.8.1.3
pkgrel=1
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL2')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('musl' 'readline' 'openssl')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('06602ffd591e98c75b3dc1d66f0f19136cc666b0b2d95caad987d6ab2cb28097')

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
