# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=bird
pkgname=bird2
pkgver=2.17.1
pkgrel=3
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://bird.network.cz/'
license=('GPL-2.0-or-later')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('linux-headers')
options=(!emptydirs)
backup=(etc/bird.conf)
conflicts=(bird)
provides=(bird)
source=(
  "https://bird.network.cz/download/$_pkgname-$pkgver.tar.gz"
  bird.service
  bird.tmpfiles
)
sha256sums=('bfd718dfa596819b3801688783212514b467163329aec9bbcd0fa3dee03e10e9'
            '7ddea1f507efd2d4a7ad1fea044a3122f0f798887ee9fbd1c8b5ff32fdeafb84'
            '93ccf34aa61e513f27b5287437b68a4f176dfdca9b05a05de6a15aa0dcdd6205')

prepare()
{
  cd $_pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $_pkgname-$pkgver
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
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  _dinit_install_services_ "$srcdir/bird.service"
  install -D "$srcdir/bird.tmpfiles" "$pkgdir/etc/tmpfiles.d/bird.conf"
}
