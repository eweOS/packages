# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lzo
pkgver=2.10
pkgrel=1
pkgdesc="Portable lossless data compression library"
arch=(x86_64 aarch64 riscv64)
url="https://www.oberhumer.com/opensource/lzo"
license=('GPL')
provides=('liblzo2.so' 'libminilzo.so')
source=(https://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz)
sha256sums=('c0f892943208266f9b6543b3ae308fab6284c5c90e627931446fb49b4221a072')

build() {
  cd lzo-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make

  # build minilzo
  cc $CPPFLAGS $CFLAGS -fpic -Iinclude/lzo -o minilzo/minilzo.o -c minilzo/minilzo.c
  cc $LDFLAGS -shared -o libminilzo.so.0 -Wl,-soname,libminilzo.so.0 minilzo/minilzo.o
}

check() {
  cd lzo-${pkgver}
  make test # Larger test
  make check
}

package() {
  cd lzo-${pkgver}
  make DESTDIR="${pkgdir}" install

  # install minilzo
  install -m 755 libminilzo.so.0 "${pkgdir}"/usr/lib
  install -p -m 644 minilzo/minilzo.h ${pkgdir}/usr/include/lzo
  cd "${pkgdir}"/usr/lib
  ln -s libminilzo.so.0 libminilzo.so
}
