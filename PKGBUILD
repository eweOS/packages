# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=3.0.10
pkgrel=1
pkgdesc='Package compiler and linker metadata toolkit'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/pkgconf/pkgconf'
license=(ISC)
source=(
  "$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
)
makedepends=(meson automake autoconf libtool)
sha256sums=('11818a25f2730132f3b258ac8be4e82f83b9db03a1a99a6c29cd01b94fc9d310')

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
