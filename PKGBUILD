# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.10
pkgrel=1
pkgdesc="The Advanced Linux Sound Architecture (ALSA) - library"
arch=(x86_64 aarch64 riscv64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2" musl.patch)
sha256sums=('c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e'
            '652041b6622b974225f904cbc8d350ba84052f1b74f7eb0b8e044012fb8f6c36')

prepare()
{
  cd $pkgname-$pkgver
  # https://github.com/alsa-project/alsa-lib/issues/350
  patch -p1 < ../musl.patch
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
