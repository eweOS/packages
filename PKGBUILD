# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libbs2b
pkgver=3.1.0
pkgrel=1
pkgdesc="Bauer stereophonic-to-binaural DSP effect library"
url="http://bs2b.sourceforge.net"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom:MIT)
depends=(libsndfile)
source=("https://downloads.sourceforge.net/sourceforge/bs2b/$pkgname-$pkgver.tar.lzma"
        formatsecurity.diff)
md5sums=('00d32ffa6461dde6a632c846da3e0a13'
         'af1c91f47bd7481cd71fc38a3a35f0e7')

prepare() {
  cd $pkgname-$pkgver

  # Fix error: format not a string literal and no format arguments [-Werror=format-security]
  patch -Np1 -i ../formatsecurity.diff

  sed -i 's/dist-lzma/dist-xz/g' configure.ac

  autoreconf -fvi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(libsndfile.so)
  provides+=(libbs2b.so)

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
