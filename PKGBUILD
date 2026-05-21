# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=muparser
pkgver=2.3.5
pkgrel=2
pkgdesc="A fast math parser library"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="http://muparser.sourceforge.net/"
depends=(openmp)
makedepends=('cmake')
license=('custom')
options=('!makeflags')
source=(https://github.com/beltoforion/muparser/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('48610dd112b5c8e1ea7615e29c9f9ca185091392b651794de039c14edfad4c62a6ae1d087393fdfd8d03a99f94a6e71275b86ddc8027234d322030bc7c25223e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -D -m644 $pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
