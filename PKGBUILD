# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=optipng
pkgver=0.7.8
pkgrel=1
pkgdesc='Compresses PNG files to a smaller size, without losing any information.'
arch=(x86_64 aarch64 riscv64)
url='http://optipng.sourceforge.net/'
license=('ZLIB')
depends=('libpng' 'zlib')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('25a3bd68481f21502ccaa0f4c13f84dcf6b20338e4c4e8c51f2cefbd8513398c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --mandir=/usr/share/man --with-system-libs
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="$pkgdir/usr" mandir="$pkgdir/usr/share/man" install

  # install license
  install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
