# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=2.1.1
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
sha256sums=('6a181e0bf1195e95b7cd535a1854827aedb383b26b1fc24ca13586cb5e8e55af')

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
