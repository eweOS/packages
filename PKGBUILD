# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=ragel
pkgver=6.10
pkgrel=3
pkgdesc="Finite state machine compiler"
arch=('x86_64')
url="http://www.complang.org/ragel/"
license=('GPL')
depends=('llvm-libs')
source=(https://www.colm.net/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr CXXFLAGS="$CXXFLAGS -std=gnu++98" 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -m0644 -D ragel.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/ragel.vim
}
