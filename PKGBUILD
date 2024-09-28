# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libtommath
pkgver=1.3.0
pkgrel=1
pkgdesc='Highly optimized and portable routines for integer based number theoretic applications'
url='http://www.libtom.net/'
license=(custom)
arch=(x86_64 aarch64 riscv64)
source=(https://github.com/libtom/libtommath/releases/download/v$pkgver/ltm-$pkgver.tar.xz)
sha256sums=('296272d93435991308eb73607600c034b558807a07e829e751142e65ccfa9d08')

build() {
  cd $pkgname-$pkgver

  make -f makefile.shared IGNORE_SPEED=1
}

package() {
  cd $pkgname-$pkgver

  make -f makefile.shared PREFIX=/usr DESTDIR="$pkgdir" INSTALL_GROUP=root install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
