# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=libmd
pkgver=1.1.0
pkgrel=1
pkgdesc="Message Digest functions from BSD systems"
arch=(x86_64 aarch64 riscv64)
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
depends=('musl')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332')

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
