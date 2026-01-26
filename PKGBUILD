# Maintainer: YukariChiba <i@0x7f.cc>

pkgname=alsa-lib
pkgver=1.2.15
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
# close-range.patch: downstream, remove close_range() (not in musl)
source=("$url/files/pub/lib/$pkgname-$pkgver.tar.bz2" close-range.patch)
sha256sums=('83770841585e766a60c99fd23f8c574c22643ae0cb1f2d20b793c3d84eb95a8d'
            '078dcc3d1f3bf12baf41f73d2f3fe2b01b6e1d85f37a27660db3ab148ea1c063')

prepare()
{
  _patch_ $pkgname-$pkgver
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
