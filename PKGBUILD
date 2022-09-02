# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=patch
pkgver=2.7.6
pkgrel=1
pkgdesc="A utility to apply patch files to original sources"
arch=(x86_64)
license=(GPL3)
groups=(base-devel)
depends=(musl attr)

source=(
    "http://ftp.gnu.org/gnu/patch/patch-${pkgver}.tar.xz"
)

sha256sums=(
    'SKIP'
)

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
