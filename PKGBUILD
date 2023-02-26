# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libdaemon
pkgver=0.14
pkgrel=5
pkgdesc='Lightweight C library that eases the writing of UNIX daemons'
url='http://0pointer.de/lennart/projects/libdaemon/'
license=('LGPL2')
arch=(x86_64 aarch64)
source=("https://dev.alpinelinux.org/archive/libdaemon/libdaemon-${pkgver}.tar.gz"
  fix-includes-unistd.patch
  "config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"
  "config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD")
sha512sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare()
{
  cd "${pkgname}-${pkgver}"
  patch -p1 < $srcdir/fix-includes-unistd.patch
  cp $srcdir/config.sub $srcdir/config.guess .
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --disable-lynx
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
