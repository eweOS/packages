# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.4.0
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://htop.dev/'
license=('GPL')
depends=('ncurses')
makedepends=(autoconf)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('feaabd2d31ca27c09c367a3b1b547ea9f96105fc41f4dfa799e2f49daad5de29')

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
