# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=patch
pkgver=2.8
pkgrel=1
pkgdesc="A utility to apply patch files to original sources"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL3)
depends=(musl attr)
source=("http://ftp.gnu.org/gnu/patch/patch-${pkgver}.tar.xz")
sha256sums=('f87cee69eec2b4fcbf60a396b030ad6aa3415f192aa5f7ee84cad5e11f7f5ae3')

# update the scripts manually instead of calling autoconf
# this may ease bootstrap working
prepare() {
  cp /usr/share/autoconf/build-aux/config.{guess,sub} \
  	"$pkgname-$pkgver"/build-aux
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
