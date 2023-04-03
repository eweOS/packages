# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libdaemon
pkgver=0.14
pkgrel=6
pkgdesc='Lightweight C library that eases the writing of UNIX daemons'
url='http://0pointer.de/lennart/projects/libdaemon/'
license=('LGPL2')
arch=(x86_64 aarch64)
source=("https://dev.alpinelinux.org/archive/libdaemon/libdaemon-${pkgver}.tar.gz"
  fix-includes-unistd.patch
  "config.sub::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.sub;hb=HEAD"
  "config.guess::http://git.savannah.gnu.org/gitweb/?p=config.git;a=blob_plain;f=config.guess;hb=HEAD")
sha512sums=('a96b25c09bd63cc192c1c5f8b5bf34cc6ad0c32d42ac14b520add611423b6ad3d64091a47e0c7ab9a94476a5e645529abccea3ed6b23596567163fba88131ff2'
            '2351e87a645d997d4f549807b809376ab7be78f833f6ba44100509b7ffdd9f526ec95c3a265d059eb35531fa489e814e21bc6ab85540c539c67677124d2f7924'
            '0934d0d3d1cdc24719c89968eeb2377a9e7c07a0cf8fc3a1282785483a8812e823d459b3c41475fc7fec0284cb596898a44badf7d25a0de14532225c01602a4d'
            '47cfb4ec0854c88caccbfd62b081b27f668b5d135b8a0fea046671e68d85fe7f8efe828d6f3d34aa6ed593b459c3ad0ccff4488b33ce594e6fc99468d0a837e7')

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
