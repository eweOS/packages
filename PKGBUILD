# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dos2unix
pkgver=7.5.2
pkgrel=2
pkgdesc='Text file format converter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://waterlan.home.xs4all.nl/dos2unix.html'
license=('BSD')
makedepends=('perl')
conflicts=('hd2u')
source=(https://waterlan.home.xs4all.nl/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a')

build() {
  cd $pkgname-$pkgver
  make LDFLAGS_USER="${LDFLAGS}"
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

