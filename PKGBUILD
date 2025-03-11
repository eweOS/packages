# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=bird
pkgver=3.0.1
pkgrel=2
pkgdesc='RIP, OSPF, BGP, MPLS, BFD, Babel routing daemon'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://bird.network.cz/'
license=('GPL2')
depends=('musl' 'readline' 'ncurses' 'libssh2')
makedepends=('bison' 'flex' 'linux-headers' 'autoconf')
options=(!emptydirs)
source=(
  "https://bird.network.cz/download/$pkgname-$pkgver.tar.gz"
  bird.service
  bird.tmpfiles
)
sha256sums=('8868403caa84e2554bb6e60adbe7c657e7bb7c4ac41910e398f35e236ba90fa1'
            '781cb34f987728bf078d9b44a97f39e62a653c1024c8bbc9e96e059ec449ddbe'
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
