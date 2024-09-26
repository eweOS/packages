# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=botan
pkgver=3.5.0
pkgrel=1
pkgdesc='Crypto library written in C++'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('67e8dae1ca2468d90de4e601c87d5f31ff492b38e8ab8bcbd02ddf7104ed8a9f')

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
