# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qrencode
pkgver=4.1.1
pkgrel=2
pkgdesc="C library for encoding data in a QR Code symbol."
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('libpng')
makedepends=(sdl2 autoconf)
url="https://fukuchi.org/works/qrencode/"
license=('GPL')
source=(https://fukuchi.org/works/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('e455d9732f8041cf5b9c388e345a641fd15707860f928e94507b1961256a6923')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}
