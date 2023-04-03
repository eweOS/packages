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
sha512sums=('b7ca2ed063f003581020d2043b1686915997261695bb0aef6e530431ea55781861ba19e16ce1fb74eb892203c9433c8652d105d380c0a6a24590f13fb1a401be')

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
