# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lcms2
pkgver=2.16
pkgrel=1
pkgdesc='Small-footprint color management engine, version 2'
arch=(x86_64 aarch64 riscv64)
url='http://www.littlecms.com/'
license=('MIT')
depends=('libtiff')
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51')

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
