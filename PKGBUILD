# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libb2
pkgver=0.98.1
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp hash functions'
url='https://blake2.net/'
license=(CC0-1.0)
makedepends=(git)
source=(git+https://github.com/BLAKE2/libb2#tag=v$pkgver)
sha256sums=('eb6b596bc30918427d1e792914f454c1d3e61fef3d4499f6605ede78f835cc1b')

# libb2's build system discards the $CFLAGS variable.
# We can get around this by putting those flags in $CC.
export CC="${CC-cc} $CFLAGS"

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  if [ "$CARCH" == "x86_64" ]; then
    _extraflags="--enable-fat"
  else
    _extraflags=""
  fi
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared \
    --disable-native \
    ${_extraflags}
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
