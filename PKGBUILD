# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vnstat
pkgver=2.12
pkgrel=2
pkgdesc="A console-based network traffic monitor"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://humdi.net/vnstat/"
license=('GPL')
depends=('bash' 'sqlite')
makedepends=('gd' 'autoconf')
optdepends=('gd: image output')
backup=(etc/vnstat.conf)
source=(https://humdi.net/vnstat/$pkgname-$pkgver.tar.gz vnstat.service)
sha256sums=('b7386b12fc1fc6f47fab31f208b12eda61862e63e229e84e95a6fa80406d2852'
            '2b1d50b267ffad28cd0c179f411183063ab3efeccda8d400c7cc4f3200cf3d98')

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
