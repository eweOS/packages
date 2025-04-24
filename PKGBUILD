# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.4.1
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://htop.dev/'
license=(GPL-2.0-or-later)
depends=(musl ncurses)
makedepends=(linux-headers)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('904f7d4580fc11cffc7e0f06895a4789e0c1c054435752c151e812fead9f6220')

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
