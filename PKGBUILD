# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20260227
pkgrel=2
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('8d628d6615a110c4fe6f49f8b9cfbfc0ab955d4ab4a3a13c6d7a1b4d6101138c98e6b764986c662c701e3feef1510004ec21854f71fc6027cb372adde09b69ec')

_makeflags=(
  'prefix=/usr'
  'mandir=/usr/share/man'
)

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make ${_makeflags[@]}
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"

  make install ${_makeflags[@]} INSTALL=install DESTDIR="$pkgdir" BINDIR=/usr/bin

  install -Dm0644 README "$pkgdir/usr/share/licenses/$pkgname/README"
}
