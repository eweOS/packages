# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=popt
pkgver=1.19
pkgrel=2
pkgdesc="A commandline option parser"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/rpm-software-management/popt"
license=('custom')
depends=('musl')
source=(https://ftp.osuosl.org/pub/rpm/popt/releases/popt-1.x/popt-${pkgver}.tar.gz)
sha256sums=('c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9')

build()
{
  cd "${pkgname}-${pkgver}"
  autoreconf -ivf
  ./configure --prefix=/usr
  make
}

package()
{
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
