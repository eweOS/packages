# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=pkgconf
pkgver=3.0.5
pkgrel=1
pkgdesc='Package compiler and linker metadata toolkit'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/pkgconf/pkgconf'
license=(ISC)
source=(
  "$url/archive/refs/tags/$pkgname-$pkgver.tar.gz"
)
makedepends=(meson automake autoconf libtool)
sha256sums=('245d441b9d8f7b74390e060cb9db1a326c26f1b96b1a6c3216b54a5d5439367a')

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
