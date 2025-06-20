# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=2.5.0
pkgrel=1
pkgdesc='Package compiler and linker metadata toolkit'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/pkgconf/pkgconf'
license=(ISC)
groups=(base-devel)
source=(
  "$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
)
makedepends=(meson automake autoconf libtool)
sha256sums=('89060c3b3e5e5c7d7101eefd6fb8df8d9bcdc6c14217390b925557b6c0064671')

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
  _install_license_ COPYING
}
