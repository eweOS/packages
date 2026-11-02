# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20260719
pkgrel=1
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('439d5dd48c3b56d01595c812a9316c46227848fb3063c79c9e46ebcafe512d246351dbf9fe0e733d4b5c2438962a7e5e5a5b60af30c51efc2de526a5b56eb7dc')

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
