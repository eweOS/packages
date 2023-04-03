# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcgiwrap
pkgver=1.1.0
pkgrel=3
pkgdesc='A simple server for running CGI applications over FastCGI.'
arch=(x86_64 aarch64)
license=('MIT')
url='https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/'
depends=('fcgi')
source=(
  "https://github.com/gnosek/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  fcgiwrap.service
  fcgiwrap.prerun.service
  fcgiwrap.prerun
)
sha256sums=('4c7de0db2634c38297d5fcef61ab4a3e21856dd7247d49c33d9b19542bd1c61f'
            '68837760666aa20bace0119aaa802f865f711c868c4ebead8bfc1f979b5954e4'
            'd286b7a467fe8dcc8b947be66be99ef6ab4d9dddb4ecc27310b4e6071bb1e5de'
            '9b91fec580deac69f957d1c13d12ee8ebbc745df4a2e8e0f045d96901ca0f502')

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
  install -d $pkgdir/etc/dinit.d/prerun.d
  install $srcdir/fcgiwrap.service $pkgdir/etc/dinit.d/fcgiwrap
  install $srcdir/fcgiwrap.prerun $pkgdir/etc/dinit.d/prerun.d/fcgiwrap
  install $srcdir/fcgiwrap.prerun.service $pkgdir/etc/dinit.d/fcgiwrap-prerun
}
