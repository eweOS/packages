# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bird
pkgver=2.15.1
_pkgver=2.15
pkgrel=0
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64 riscv64)
url='https://bird.network.cz/'
license=('GPL2')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('bison' 'flex')
options=(!emptydirs)
source=(
  "https://bird.network.cz/download/$pkgname-$_pkgver.tar.gz"
  bird.service
  bird.tmpfiles
)
sha256sums=('7a6458fa41109c005531b23e3f7abd63d7000a99d195db4944ebccb539ed02f0'
            '34c2bb0f9f89315914cfaf94e23c91ca7e72db42cd4f3d1a456f5541a3da5868'
            '93ccf34aa61e513f27b5287437b68a4f176dfdca9b05a05de6a15aa0dcdd6205')

build()
{
  cd $pkgname-$_pkgver
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
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
  install -D "${srcdir}/bird.service" "$pkgdir/etc/dinit.d/bird"
  install -D "${srcdir}/bird.tmpfiles" "$pkgdir/etc/tmpfiles.d/bird.conf"
}
