# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=2.3.0
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
sha256sums=('0ee103cd390c3ee0e77a7a1c71dcb79a50a426fa2a648f6d07f2678c23adc5e3')

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
