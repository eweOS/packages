# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bird
pkgver=2.13.1
pkgrel=1
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64 riscv64)
url='https://bird.network.cz/'
license=('GPL2')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('bison' 'flex')
options=(!emptydirs)
source=(
  "https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
  bird.service
  bird.tmpfiles
)
sha256sums=('97bb8d57be9bc5083e2b566416d27e314162856a12ca7c77e202e467d20d4080'
            '34c2bb0f9f89315914cfaf94e23c91ca7e72db42cd4f3d1a456f5541a3da5868'
            '93ccf34aa61e513f27b5287437b68a4f176dfdca9b05a05de6a15aa0dcdd6205')

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
  install -D "${srcdir}/bird.service" "$pkgdir/etc/dinit.d/bird"
  install -D "${srcdir}/bird.tmpfiles" "$pkgdir/etc/tmpfiles.d/bird.conf"
}
