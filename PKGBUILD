# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lcms2
pkgver=2.18
pkgrel=1
pkgdesc='Small-footprint color management engine, version 2'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.littlecms.com/'
license=('MIT')
depends=('libtiff')
makedepends=('autoconf')
provides=('liblcms2.so' 'liblcms2')
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347')

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
