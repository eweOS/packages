# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20240709
pkgrel=1
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('1715f3378059c995cffd9b7e6f8d237cdbae43e67516542c9ef3a5d30c7d0b78183bce1f21db6570877261c2804258f664199b4a46febbf2c10ec25e08833926')

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
