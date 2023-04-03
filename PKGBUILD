# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.2.1
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64)
url='https://htop.dev/'
license=('GPL')
depends=('ncurses')
makedepends=(autoconf)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('5a17121cf1c69d2f2e557c0b29d45a2c353ab983f644742e1c2e4ece15aa6cbb')

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
