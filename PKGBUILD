# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=botan
pkgver=3.6.0
pkgrel=1
pkgdesc='Crypto library written in C++'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://botan.randombit.net/'
license=(BSD-2-Clause)
depends=(bzip2
         sqlite
         xz
         zlib)
makedepends=(boost python linux-headers)
optdepends=('boost-libs: for the botan executable'
            'python: for using botan2.py')
source=(https://botan.randombit.net/releases/Botan-${pkgver}.tar.xz)
sha256sums=('e6ec54a58c96914d7ce560f17a9a5659ebb987e053323bb9ca2bffeb90707e7a')

build() {
  cd ${pkgname^}-$pkgver

  ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-lzma \
    --with-zlib \
    --with-boost \
    --with-sqlite3 \
    --with-os-feature=getrandom \
    --cc=clang
  make
}

check() {
  cd ${pkgname^}-$pkgver

  LD_LIBRARY_PATH="$PWD" ./botan-test
}

package() {
  DESTDIR="$pkgdir" make -C ${pkgname^}-$pkgver install
  install -Dm644 ${pkgname^}-$pkgver/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
