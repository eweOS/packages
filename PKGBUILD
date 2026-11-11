# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=snowball
pkgname=(snowball libstemmer)
pkgver=3.2.0
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
url="https://snowballstem.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
makedepends=(git)
# 0001: downstream, allow libstemmer to be built as a shared library
source=("git+https://github.com/snowballstem/snowball#tag=v$pkgver"
	0001-build-Build-and-link-to-libstemmer-as-a-shared-libra.patch)
sha256sums=('180c33c4f670b7335ae9b6a4402cc146673e06df06479ea89b01296dc7978109'
            '150dd51ecadfb95f8d96ea464ef6bd1f76cae07ea9d199f5137c427b3a62deb7')

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
