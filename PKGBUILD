# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bird
pkgver=2.0.10
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64)
url='https://bird.network.cz/'
license=('GPL2')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('bison' 'flex')
options=(!emptydirs)
source=(
  "https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
  bird.service
  bird.prerun
  bird.prerun.service
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --runstatedir=/run/$pkgname \
    --docdir=/usr/share/doc/$pkgname
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/etc/dinit.d/"
  install -d "$pkgdir/etc/dinit.d/prerun.d"
  install "${srcdir}/bird.service" "$pkgdir/etc/dinit.d/bird"
  install "${srcdir}/bird.prerun.service" "$pkgdir/etc/dinit.d/bird-prerun"
  install "${srcdir}/bird.prerun" "$pkgdir/etc/dinit.d/prerun.d/bird"
}
