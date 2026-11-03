# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=aspell
pkgver=0.60.8.3
_pkgmajorver=0.60
pkgrel=1
pkgdesc="A spell checker designed to eventually replace Ispell"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://aspell.net/"
license=('LGPL')
depends=('llvm-libs' 'ncurses')
makedepends=('texinfo')
optdepends=('perl: to import old dictionaries')
source=("https://github.com/GNUAspell/aspell/archive/rel-$pkgver.tar.gz")
sha512sums=('78b6b065441bf75979e7acc0675748d7f7feb3c115dcb938f59d24872adf4a4970fb3ce39acf7882be7bce2749c237b6d9cd0d7089512613650ecc199d4f0941')

build()
{
  cd $pkgname-rel-$pkgver
  PERL_USE_UNSAFE_INC=1 ./autogen
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-dict-dir=/usr/share/$pkgname
  make
}

check()
{
  cd $pkgname-rel-$pkgver
  make check
}

package()
{
  cd $pkgname-rel-$pkgver
  make DESTDIR="$pkgdir" install
  ln -s $pkgname-$_pkgmajorver "$pkgdir"/usr/lib/$pkgname
}
