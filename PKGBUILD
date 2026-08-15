# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.5.2
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://htop.dev/'
license=(GPL-2.0-or-later)
depends=(musl ncurses)
makedepends=(linux-headers)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('225128e697c4a8c8a878fd0078c965ff8bd5fb24913bfc8473b8edbd50f843f8')

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
