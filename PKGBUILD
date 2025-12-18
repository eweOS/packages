# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vnstat
pkgver=2.13
pkgrel=2
pkgdesc="A console-based network traffic monitor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://humdi.net/vnstat/"
license=('GPL')
depends=('bash' 'sqlite')
makedepends=('gd' 'autoconf')
optdepends=('gd: image output')
backup=(etc/vnstat.conf)
source=(https://humdi.net/vnstat/$pkgname-$pkgver.tar.gz vnstat.service)
sha256sums=('c9fe19312d1ec3ddfbc4672aa951cf9e61ca98dc14cad3d3565f7d9803a6b187'
            'e7b83891bd9066d951247422764e18cf999aa9bd731064da2a0cce395a04aece')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0755 examples/vnstat.cgi -t "$pkgdir"/usr/share/doc/vnstat/examples
  _dinit_install_services_ $srcdir/vnstat.service
}
