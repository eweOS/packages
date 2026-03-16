# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.15.3
pkgrel=1
pkgdesc="The Advanced Linux Sound Architecture (ALSA) - library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.alsa-project.org"
license=(LGPL-2.1-or-later)
makedepends=(linux-headers)
provides=(
  libasound.so
  libatopology.so
)
# close_range() replaced with closefrom() in 1.2.15.1 (not needed)
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2")
sha256sums=('7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e')

prepare()
{
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --without-debug
  make
}

check()
{
  cd $pkgname-$pkgver
  make -k check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm 644 {MEMORY-LEAK,TODO,NOTES,ChangeLog,doc/asoundrc.txt} -t "$pkgdir/usr/share/doc/$pkgname/"
}
