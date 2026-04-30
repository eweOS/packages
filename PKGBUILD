# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lcms2
pkgver=2.19
pkgrel=1
pkgdesc='Small-footprint color management engine, version 2'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.littlecms.com/'
license=('MIT')
depends=('libtiff')
makedepends=('autoconf')
provides=('liblcms2.so' 'liblcms2')
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216')

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
