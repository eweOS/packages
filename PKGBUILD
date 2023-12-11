# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libdaemon
pkgver=0.14
pkgrel=8
pkgdesc='Lightweight C library that eases the writing of UNIX daemons'
url='http://0pointer.de/lennart/projects/libdaemon/'
license=('LGPL2')
arch=(x86_64 aarch64 riscv64)
_config_githash='4ad4bb7c30aca1e705448ba8d51a210bbd47bb52'
_config_url='http://git.savannah.gnu.org/gitweb/?p=config.git'
source=(
  "https://dev.alpinelinux.org/archive/libdaemon/libdaemon-${pkgver}.tar.gz"
  0-fix-includes-unistd.patch
)
sha512sums=('a96b25c09bd63cc192c1c5f8b5bf34cc6ad0c32d42ac14b520add611423b6ad3d64091a47e0c7ab9a94476a5e645529abccea3ed6b23596567163fba88131ff2'
            '2351e87a645d997d4f549807b809376ab7be78f833f6ba44100509b7ffdd9f526ec95c3a265d059eb35531fa489e814e21bc6ab85540c539c67677124d2f7924')

prepare()
{
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  autoreconf -fiv
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
