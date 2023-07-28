# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.2.2
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64)
url='https://htop.dev/'
license=('GPL')
depends=('ncurses')
makedepends=(autoconf)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('bac9e9ab7198256b8802d2e3b327a54804dc2a19b77a5f103645b11c12473dc8')

prepare()
{
  cd "${pkgname}-${pkgver}"
  autoreconf -fi
}

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
