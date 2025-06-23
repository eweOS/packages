# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20250523
pkgrel=1
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('8473ab56203022e596819d99d2eedf2045a4c06d42e64edf77a16a6b0b7e4fb3d66cf9728a6c57856157f2fcfe94a38191e2f4b81c22c4e27ab9b5c610c4d5f2')

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
