# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=2.0.3
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
sha256sums=('d139baa5ea65e8bd9267f416c3bb88a91cf66f6bc84b1be0408cabfe886a4b3b')

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
