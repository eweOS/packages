# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
# Contributor: Isaac Dupree <antispam@idupree.com>

pkgname=libsass
pkgver=3.6.6
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library)."
arch=(x86_64 aarch64 riscv64)
url="https://sass-lang.com/libsass"
license=("MIT")
source=("$pkgname-$pkgver.tar.gz::https://github.com/sass/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('11f0bb3709a4f20285507419d7618f3877a425c0131ea8df40fe6196129df15d')

build()
{
  cd "$srcdir/$pkgname-$pkgver"

  export LIBSASS_VERSION="$pkgver"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
