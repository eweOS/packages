# Maintainer: Yukari Chiba <i@0x7f.cc> 

pkgname=dosfstools
pkgver=4.2
pkgrel=1
pkgdesc="DOS filesystem utilities"
arch=(x86_64 aarch64 riscv64)
depends=('glibc')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz
)
url="https://github.com/dosfstools/dosfstools"
license=('GPL-3.0-or-later')
sha256sums=('64926eebf90092dca21b14259a5301b7b98e7b1943e8a201c7d726084809b527')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib \
              --sbindir=/usr/bin --mandir=/usr/share/man \
              --docdir=/usr/share/doc/dosfstools --enable-compat-symlinks
   make
}

package () {
   cd $pkgname-$pkgver
   make DESTDIR="$pkgdir" install
}
