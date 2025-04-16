# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.14
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
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2")
sha256sums=('be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32')

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
