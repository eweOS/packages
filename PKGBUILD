# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=libmd
pkgver=1.0.4
pkgrel=1
pkgdesc="Message Digest functions from BSD systems"
arch=(x86_64 aarch64)
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
depends=('musl')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('f51c921042e34beddeded4b75557656559cf5b1f2448033b4c1eec11c07e530f')

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check()
{
  cd ${pkgname}-${pkgver}
  make -k check
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
