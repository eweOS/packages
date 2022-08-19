# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcgiwrap
pkgver=1.1.0
pkgrel=1
pkgdesc='A simple server for running CGI applications over FastCGI.'
arch=('x86_64')
license=('MIT')
url='https://www.nginx.com/resources/wiki/start/topics/examples/fcgiwrap/'
depends=('fcgi')
source=(
  "https://github.com/gnosek/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  fcgiwrap.service
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd ${pkgbase}-${pkgver}
  autoreconf -i
}

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr --mandir=/share/man --sbindir=/bin
  make
}

package() {
  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d $pkgdir/var/run/fcgiwrap
  install -d $pkgdir/etc/dinit.d/
  install $srcdir/fcgiwrap.service $pkgdir/etc/dinit.d/fcgiwrap
}
