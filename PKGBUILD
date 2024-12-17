# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libspectre
pkgver=0.2.12
pkgrel=1
pkgdesc='Small library for rendering Postscript documents'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
url='https://www.freedesktop.org/wiki/Software/libspectre'
depends=(ghostscript)
source=(https://libspectre.freedesktop.org/releases/$pkgname-$pkgver.tar.gz)
sha256sums=('55a7517cd3572bd2565df0cf450944a04d5273b279ebb369a895391957f0f960')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
