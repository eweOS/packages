# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=snowball
pkgname=(snowball libstemmer)
pkgver=3.0.1
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
url="https://snowballstem.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
makedepends=(git)
# 0001: downstream, allow libstemmer to be built as a shared library
source=("git+https://github.com/snowballstem/snowball#tag=v$pkgver"
	0001-build-Build-and-link-to-libstemmer-as-a-shared-libra.patch)
sha256sums=('24ba26d9cb8c673aa4e509a389f8fdb83ddf6f8f8cd32ac0d95f06b63e056b94'
            '3bfbb142d7f1c5c09e5c3eb539deefbc43a6310ac04914892c875015d4589338')

prepare() {
  _patch_ snowball
}

build() {
  cd snowball
  make
}

# No check - needs external test data

package_snowball() {
  depends=(libstemmer)

  cd snowball

  install -Dt "$pkgdir/usr/bin" snowball stemwords

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_libstemmer() {
  pkgdesc="Stemming library supporting several languages"
  provides=(libstemmer.so)

  cd snowball

  install -Dt "$pkgdir/usr/include" -m644 include/libstemmer.h
  install -Dm644 libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so.0.0.0"
  ln -s libstemmer.so.0.0.0 "$pkgdir/usr/lib/libstemmer.so.0"
  ln -s libstemmer.so.0 "$pkgdir/usr/lib/libstemmer.so"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}
