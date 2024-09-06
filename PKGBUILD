# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=enet
pkgver=1.3.18
pkgrel=1
pkgdesc='A relatively thin, simple and robust network communication layer on top of UDP'
arch=('x86_64' 'aarch64' 'riscv64')
url='http://enet.bespin.org/'
license=('custom')
source=("http://enet.bespin.org/download/${pkgname}-${pkgver}.tar.gz")
sha512sums=('d39b3bc78274ed4040580a0b13f7e628829d88993aa1bae15ab02afe64598badb2c6863b128f25234e27c3a8c4bcfbda360b3b237c92388675714549e9757bb5')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
