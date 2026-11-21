# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bird
pkgver=3.4.0
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://bird.nic.cz/'
license=('GPL-2.0-or-later')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('bison' 'flex' 'linux-headers' 'autoconf')
options=(!emptydirs)
backup=(etc/bird.conf)
source=(
  "https://bird.nic.cz/download/$pkgname-$pkgver.tar.gz"
  bird.service
  bird.tmpfiles
)
sha256sums=('ee8900c98de7b4da0f2b5480eb66adc3aca6961baeba4ac949481ccac3ed365f'
            '7ddea1f507efd2d4a7ad1fea044a3122f0f798887ee9fbd1c8b5ff32fdeafb84'
            '93ccf34aa61e513f27b5287437b68a4f176dfdca9b05a05de6a15aa0dcdd6205')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

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
  _dinit_install_services_ "$srcdir/bird.service"
  install -D "${srcdir}/bird.tmpfiles" "$pkgdir/etc/tmpfiles.d/bird.conf"
}
