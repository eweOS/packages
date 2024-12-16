# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xerces-c
pkgver=3.2.5
pkgrel=1
pkgdesc="A validating XML parser written in a portable subset of C++"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://xerces.apache.org/xerces-c/"
license=('APACHE')
depends=('curl' 'libnsl' 'icu')
source=("https://archive.apache.org/dist/xerces/c/3/sources/${pkgname}-${pkgver}.tar.gz")
sha256sums=('545cfcce6c4e755207bd1f27e319241e50e37c0c27250f11cda116018f1ef0f5')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
