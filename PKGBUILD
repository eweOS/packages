# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpciaccess
pkgver=0.17
pkgrel=1
pkgdesc="X11 PCI access library"
arch=(x86_64 aarch64)
license=('custom')
url="https://xorg.freedesktop.org/"
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('8484605c66ef18c8d8a3e029a6d33e26fcaa450c1263790d89ac8b0a160ffb2dfceaa6140ac9ad7d8087283ecbec8ac801f757e44890d547c3cbecd2c922ca47')

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
