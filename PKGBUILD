# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.11
pkgrel=1
pkgdesc="The Advanced Linux Sound Architecture (ALSA) - library"
arch=(x86_64 aarch64 riscv64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2")
sha256sums=('9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d')

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
