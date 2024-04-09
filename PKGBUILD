# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=2.2.0
pkgrel=1
pkgdesc='Package compiler and linker metadata toolkit'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/pkgconf/pkgconf'
license=(BSD)
groups=(base-devel)
source=(
  "$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
)
makedepends=(meson automake autoconf libtool)
sha256sums=('2c72cbf37b2d42a9fbf7ed8f0e5432a0b0925481f67995a21ecf77962a6000bc')

build()
{
  cd $pkgname-$pkgname-$pkgver
  autoreconf -fi
  ./configure \
    --prefix=/usr \
    --with-system-libdir=/usr/lib \
    --with-system-includedir=/usr/include
  make
}

package()
{
  cd $pkgname-$pkgname-${pkgver}
  make DESTDIR="$pkgdir" install
  ln -s pkgconf "${pkgdir}/usr/bin/pkg-config"
}
