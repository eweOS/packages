# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=flex
pkgver=2.6.4
pkgrel=1
pkgdesc="A tool for generating text-scanning programs"
arch=('x86_64')
url="https://github.com/westes/flex"
license=('custom')
groups=('base-devel')
depends=('musl' 'm4' 'bash')
source=("https://github.com/westes/flex/releases/download/v$pkgver/flex-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  ln -s flex "${pkgdir}/usr/bin/lex"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
