# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=snowball
pkgname=(snowball libstemmer)
pkgver=2.2.0
pkgrel=1
pkgdesc="String processing language for creating stemming algorithms"
url="https://snowballstem.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
makedepends=(git)
source=("git+https://github.com/snowballstem/snowball#tag=v$pkgver"
        dynamiclib.diff)
sha256sums=('61fa16448a4260e85e713e9fd469b1847cdc75bad8b5a0e3691c0c1df5a95a7b'
            'c031da5a11bafa079df6c33b38b8795b65cf2c91cc6b452dcf2b10612288a3e6')

prepare() {
  cd snowball
  git apply -3 ../dynamiclib.diff
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
