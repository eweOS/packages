# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc
pkgver=8.2.8
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=(x86_64 aarch64 riscv64)
url="https://www.hboehm.info/gc/"
license=('GPL')
depends=('llvm-libs')
source=(https://github.com/ivmai/bdwgc/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('e0994bac8d1068f79a8379fa5797efbd420b22eb923d6537613e7542fc6805f74f57be0c4ff7555539461f8ace849fa1534e2077752bfb61c0e14f367b5b55af')

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
