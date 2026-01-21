# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=movit
pkgver=1.7.2
pkgrel=1
pkgdesc="The modern video toolkit"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://movit.sesse.net/"
license=('GPL')
depends=('fftw' 'libepoxy')
makedepends=('eigen' 'gtest' 'sdl2')
# downstream: 0001-remove-glx: remove glx related function
source=(https://movit.sesse.net/$pkgname-$pkgver.tar.gz 0001-remove-glx.patch)
sha256sums=('00ac1f8e46c2d3e38c75cbb7a1af0a615751c158c611cb70053094b65ecfe8d5'
            '93977abfc843009969cbd139a0efc93270ffacbef4f4bc2b42d891dc2a53bcc0')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make GTEST_DIR=/usr/src/googletest -j1
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

