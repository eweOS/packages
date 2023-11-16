# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=socat
pkgver=1.8.0.0
pkgrel=1
pkgdesc='Multipurpose relay'
url='http://www.dest-unreach.org/socat/'
license=('GPL2')
arch=(x86_64 aarch64 riscv64)
depends=('musl' 'readline' 'openssl')
source=("$url/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6010f4f311e5ebe0e63c77f78613d264253680006ac8979f52b0711a9a231e82')

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
