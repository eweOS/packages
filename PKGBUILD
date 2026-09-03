# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=lame
pkgver=4.0
pkgrel=1
pkgdesc='a high quality MP3 encoder licensed under the LGPL.'
url='https://lame.sourceforge.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.0-or-later)
depends=(musl mpg123)
makedepends=(nasm autoconf)
source=("https://sourceforge.net/projects/lame/files/lame/$pkgver/lame-$pkgver.tar.gz")
provides=('libmp3lame.so')
sha256sums=('3df5124d5ad3a98312ffd7ba6a9b36230e4f8a3e66d3ce0f425e336c32d216eb')

prepare() {
  cd lame-$pkgver
  autoreconf -fiv
}

build () {
  cd lame-$pkgver
  export CFLAGS+=" -Wno-implicit-function-declaration"
  ./configure --prefix=/usr --enable-nasm --enable-mp3rtp --enable-shared
  make
}

check() {
  cd lame-$pkgver
  make test
}

package() {
  cd lame-$pkgver
  make install DESTDIR="$pkgdir"
}
