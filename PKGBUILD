# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpciaccess
pkgver=0.17
pkgrel=1
pkgdesc="X11 PCI access library"
arch=(x86_64 aarch64)
license=('custom')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('SKIP')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
