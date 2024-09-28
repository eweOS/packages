# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gavl
pkgver=1.4.0
pkgrel=1
pkgdesc='Low level library, upon which multimedia APIs can be built'
arch=(x86_64 aarch64 riscv64)
url='http://gmerlin.sourceforge.net/'
license=(GPL-2.0-or-later)
source=("https://downloads.sourceforge.net/gmerlin/$pkgname-$pkgver.tar.gz")
sha256sums=('51aaac41391a915bd9bad07710957424b046410a276e7deaff24a870929d33ce')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/LDFLAGS="$GMERLIN_DEP_RPATH"/LDFLAGS="$LDFLAGS $GMERLIN_DEP_RPATH"/' configure{,.ac}
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  CFLAGS+=" -D_GNU_SOURCE"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-cpuflags=none \
    --without-doxygen
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
