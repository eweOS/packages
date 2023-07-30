# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libdaemon
pkgver=0.14
pkgrel=7
pkgdesc='Lightweight C library that eases the writing of UNIX daemons'
url='http://0pointer.de/lennart/projects/libdaemon/'
license=('LGPL2')
arch=(x86_64 aarch64 riscv64)
_config_githash='4ad4bb7c30aca1e705448ba8d51a210bbd47bb52'
_config_url='http://git.savannah.gnu.org/gitweb/?p=config.git'
source=("https://dev.alpinelinux.org/archive/libdaemon/libdaemon-${pkgver}.tar.gz"
  fix-includes-unistd.patch
  "config.sub::${_config_url};a=blob_plain;f=config.sub;hb=${_config_githash}"
  "config.guess::${_config_url};a=blob_plain;f=config.guess;hb=${_config_githash}")
sha512sums=('a96b25c09bd63cc192c1c5f8b5bf34cc6ad0c32d42ac14b520add611423b6ad3d64091a47e0c7ab9a94476a5e645529abccea3ed6b23596567163fba88131ff2'
            '2351e87a645d997d4f549807b809376ab7be78f833f6ba44100509b7ffdd9f526ec95c3a265d059eb35531fa489e814e21bc6ab85540c539c67677124d2f7924'
            '686e69814c5f76807089c4d7d3ab9a490d397386b5e8633085f46277391d90a0464e8de9352b70b12225e649a6bf9408d537ddbdb1a805c6d5893a4eac915ab2'
            '9ce0fc86db582aa7977c03c88da941871d006df3f4cac91bde3d14a49862e5591d0f7d7c7a7b6a503e4a907accf82b215a0825228eb2e2e355d89806208f9597')

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
