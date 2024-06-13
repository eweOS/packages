# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.12
pkgrel=1
pkgdesc="The Advanced Linux Sound Architecture (ALSA) - library"
arch=(x86_64 aarch64 riscv64)
url="https://www.alsa-project.org"
license=(LGPL2.1)
makedepends=(linux-headers)
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2")
sha256sums=('4868cd908627279da5a634f468701625be8cc251d84262c7e5b6a218391ad0d2')

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
