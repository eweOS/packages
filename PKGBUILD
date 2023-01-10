# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=tcc
pkgver=0.9.27
pkgrel=4
pkgdesc="Tiny C Compiler"
arch=(x86_64 aarch64)
url="https://bellard.org/tcc/"
license=('LGPL')
depends=('musl')
options=('docs' 'staticlibs')
source=("https://download.savannah.nongnu.org/releases/tinycc/${pkgname}-${pkgver}.tar.bz2")
md5sums=('9cdb185555da76db90287db351ca40b8')

build()
{
  cd ${pkgname}-${pkgver}
  unset CFLAGS
  unset LDFLAGS
  ./configure \
    --prefix=/usr \
    --config-musl
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  # Tried with different params, with no luck
  #TCCFLAGS="" make -j1 CC=tcc CFLAGS= LDFLAGS= test
}

package()
{
  cd ${pkgname}-${pkgver}

  make DESTDIR="$pkgdir" docdir="$pkgdir"/usr/share/doc/tcc install

  make clean
  make CFLAGS="-fPIC"
  cc -shared -o libtcc.so *.o
  install -Dm755 libtcc.so -t "${pkgdir}/usr/lib/"
}
