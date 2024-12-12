# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.8.0.2
pkgrel=1
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL2')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('musl' 'readline' 'openssl')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e9498367cb765d44bb06be9709c950f436b30bf7071a224a0fee2522f9cbb417')

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
