# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=muparser
pkgver=2.3.4
pkgrel=1
pkgdesc="A fast math parser library"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://muparser.sourceforge.net/"
depends=(openmp)
makedepends=('cmake')
license=('custom')
options=('!makeflags')
source=(https://github.com/beltoforion/muparser/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('5226fd666eaf3ff7e661bbf72e60114d0ceed10491ffa4ed2dd34cd669c6c21c037eff0388402d6b9d60b0a5a27b03ca35153e0c048328abc75dfd1eaf38ceca')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
