# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=aspell
pkgver=0.60.8
_pkgmajorver=0.60
pkgrel=2
pkgdesc="A spell checker designed to eventually replace Ispell"
arch=(x86_64 aarch64)
url="http://aspell.net/"
license=('LGPL')
depends=('llvm-libs' 'ncurses')
makedepends=('texinfo')
optdepends=('perl: to import old dictionaries')
source=("https://github.com/GNUAspell/aspell/archive/rel-$pkgver.tar.gz")
sha512sums=('SKIP')

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
