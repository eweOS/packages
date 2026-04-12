# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=htop
pkgver=3.5.0
pkgrel=1
pkgdesc='Interactive process viewer'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://htop.dev/'
license=(GPL-2.0-or-later)
depends=(musl ncurses)
makedepends=(linux-headers)
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/releases/download/${pkgver}/htop-${pkgver}.tar.xz")
sha256sums=('b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05')

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
