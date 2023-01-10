# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libdaemon
pkgver=0.14
pkgrel=5
pkgdesc='Lightweight C library that eases the writing of UNIX daemons'
url='http://0pointer.de/lennart/projects/libdaemon/'
license=('LGPL2')
arch=(x86_64 aarch64)
source=("https://dev.alpinelinux.org/archive/libdaemon/libdaemon-${pkgver}.tar.gz"
  fix-includes-unistd.patch)
sha512sums=('SKIP' 'SKIP')

prepare()
{
  cd "${pkgname}-${pkgver}"
  patch -p1 < $srcdir/fix-includes-unistd.patch
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./bootstrap.sh
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
