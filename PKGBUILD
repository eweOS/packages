# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc
pkgver=8.2.4
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=(x86_64 aarch64)
url="https://www.hboehm.info/gc/"
license=('GPL')
depends=('llvm-libs')
source=(https://github.com/ivmai/bdwgc/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('27d014378000f25fb2f5598904be85604822d5ed4553f8b3d1c279122300d3958b4432ec08f951cfd842d92121ea8a030dda34bf2475ec53d4fded551fdd3a98')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --enable-cplusplus \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  make check
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  sed 's|GC_MALLOC 1L|gc 3|g' doc/gc.man \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/man/man3/gc.3"
}
