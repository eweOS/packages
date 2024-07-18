# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=idump
pkgver=0.2.0
pkgrel=1
pkgdesc="tiny image viewer for framebuffer"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/uobikiemukot/idump"
license=('MIT')
depends=('libpng' 'libjpeg')
makedepends=('linux-headers')
source=("$url/archive/v$pkgver.tar.gz")

build() {
  cd $srcdir/$pkgname-$pkgver
  export LDFLAGS="-lpng -ljpeg";
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin/
  install -m755 ./idump $pkgdir/usr/bin/idump
}
sha256sums=('a1693ae61566a82c5c0c73638bc1ff7be5052823b185741f9b38a42cd71b92ac')
