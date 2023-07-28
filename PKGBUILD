# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20230501
pkgrel=2
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('db7b9815a01dc9fb1ff92741748d24d558c329135e591c24450d0a3bc10e38a992ef346dd744854864538f330a018415df539d06543570a3566dbabc6c88a8fd')

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
