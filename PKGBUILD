# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dos2unix
pkgver=7.5.7
pkgrel=1
pkgdesc='Text file format converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://waterlander.net/dos2unix/'
license=('BSD-2-Clause')
makedepends=('perl')
checkdepends=('perl')
conflicts=('hd2u')
source=(https://waterlander.net/dos2unix/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('669ee27120ae71589f638fe3a167d6ea54f8633f5ab1b282551bd7a7c9510dfa')

build() {
  cd $pkgname-$pkgver
  make LDFLAGS_USER="${LDFLAGS}"
}

check() {
  cd $pkgname-$pkgver
  make LDFLAGS_SUER="${LDFLAGS}" check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

