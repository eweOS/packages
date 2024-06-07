# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dmidecode
pkgver=3.5
pkgrel=1
pkgdesc="Desktop Management Interface table related utilities"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://www.nongnu.org/dmidecode"
license=('GPL')
source=("https://sources.archlinux.org/other/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073')

build() {
  cd ${pkgname}-${pkgver}

  sed -i "s:sbin:bin:g" Makefile
  make prefix=/usr CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}

  make prefix=/usr DESTDIR="${pkgdir}" install
}
