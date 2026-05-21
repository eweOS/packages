# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: David Wang <wangyudong2002@outlook.com>

pkgname=base16384
pkgdesc="Encode binary file to printable utf16be, and vice versa."
pkgver=2.3.2
pkgrel=3
license=('GPL-3.0-or-later')
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fumiama/base16384"
makedepends=('cmake')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a2c37f1628270076ce34100a44e93df3e78c02967d684ee5b0d5943c7ece486d3e4ce0b277c9f2e07ac1b17c1a2c28e95f22185c9658d34b60329fc70cafd877')

build() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
