# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=mg
pkgver=20260222
pkgrel=1
pkgdesc="Microscopic EMACS style editor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hboetes/mg"
depends=('ncurses' 'libbsd' 'musl')
makedepends=('bsd-compat-headers')
license=('Public-Domain')
source=("mg-$pkgver.tgz::https://github.com/hboetes/mg/archive/$pkgver.tar.gz")
sha512sums=('e269c81c7253ae8ba989be4e360fe455e7e6e1268521f14ff39d22b0e895b81f538d29450267ec031d1cfe2639e7a2b63fc4dffa8415620fe92f9a9f64c3f7ec')

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
