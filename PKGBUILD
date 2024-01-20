# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.3.0
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64)
url='https://htop.dev/'
license=('GPL')
depends=('ncurses')
makedepends=(autoconf)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('a69acf9b42ff592c4861010fce7d8006805f0d6ef0e8ee647a6ee6e59b743d5c')

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
