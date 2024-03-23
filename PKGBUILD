# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcgiwrap
pkgver=1.1.0
pkgrel=5
pkgdesc='A simple server for running CGI applications over FastCGI.'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
url='https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/'
depends=('fcgi')
source=(
  "https://github.com/gnosek/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  fcgiwrap.service
  fcgiwrap.tmpfiles
)
sha256sums=('4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f'
            '98c7497215d82a8522a8e5ad31bfee35c0aad12dfb89bb28b626a87d756edb5a'
            'e28e199514eaa7d7c649fc8be0ecef8d56e66f2d317a14d1713dfd3805c984e2')

prepare()
{
  cd ${pkgbase}-${pkgver}
  autoreconf -i
}

build()
{
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr --mandir=/share/man --sbindir=/bin
  make
}

package()
{
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  _dinit_install_services_ $srcdir/fcgiwrap.service
  _install_tmpfiles_ $srcdir/fcgiwrap.tmpfiles
}
