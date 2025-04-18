# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xerces-c
pkgver=3.3.0
pkgrel=2
pkgdesc="A validating XML parser written in a portable subset of C++"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://xerces.apache.org/xerces-c/"
license=('APACHE')
depends=('curl' 'libnsl' 'icu')
source=("https://archive.apache.org/dist/xerces/c/3/sources/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9555f1d06f82987fbb4658862705515740414fd34b4db6ad2ed76a2dc08d3bde')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
