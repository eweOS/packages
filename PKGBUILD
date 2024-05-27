# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpdecimal
pkgver=4.0.0
pkgrel=1
pkgdesc="Package for correctly-rounded arbitrary precision decimal floating point arithmetic"
arch=(x86_64 aarch64 riscv64)
url="https://www.bytereef.org/mpdecimal/index.html"
license=('BSD')
source=("https://www.bytereef.org/software/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha512sums=('7610ac53ac79f7a8a33fa7a3e61515810444ec73ebca859df7a9ddc18e96b990c99323172810c9cc7f6d6e1502c0be308cd443d6c2d5d0c871648e4842e05d59')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  LDXXFLAGS="$LDFLAGS" make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 COPYRIGHT.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
