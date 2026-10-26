# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.16
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
sha256sums=('122b1e3166d55fe19bcde656535d7a36f2ab10e66c72c6ad2f43f20ffded0a96')

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
