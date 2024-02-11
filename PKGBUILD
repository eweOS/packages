# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc
pkgver=8.2.6
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=(x86_64 aarch64 riscv64)
url="https://www.hboehm.info/gc/"
license=('GPL')
depends=('llvm-libs')
source=(https://github.com/ivmai/bdwgc/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('48afcc1d8570d6b5d62addf8b7b947a3836717e71c073f6dff8982744c06f5973a02e890d17e8dd93f7f997d029b49c652929e6efa0e32aefbcdf7ab0910eda5')

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
