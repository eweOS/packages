# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=popt
pkgver=1.19
pkgrel=1
pkgdesc="A commandline option parser"
arch=('x86_64' 'aarch64')
url="https://github.com/rpm-software-management/popt"
license=('custom')
depends=('musl')
source=(https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz)
sha256sums=('SKIP')

build()
{
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
