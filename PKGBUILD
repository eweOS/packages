# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.5.1
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://htop.dev/'
license=(GPL-2.0-or-later)
depends=(musl ncurses)
makedepends=(linux-headers)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a')

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
