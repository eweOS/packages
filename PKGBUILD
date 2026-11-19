# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: C. Dominik Bódi <dominik dot bodi at gmx dot de>

pkgname=libmd
pkgver=1.3.0
pkgrel=1
pkgdesc="Message Digest functions from BSD systems"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hadrons.org/software/libmd/"
license=('BSD')
depends=('musl')
source=("https://libbsd.freedesktop.org/releases/$pkgname-$pkgver.tar.xz")
sha256sums=('fc0f1eb6b6766470326f2c014693809190e67dba84274a6fbae9d4912d066706')

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
