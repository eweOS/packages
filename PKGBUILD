# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=botan
pkgver=3.6.1
pkgrel=3
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
# 0001: fix build with boost 1.87
# https://github.com/randombit/botan/pull/4477
source=("https://botan.randombit.net/releases/Botan-$pkgver.tar.xz"
	"0001-fix-build-with-boost.1.87.patch::https://github.com/randombit/botan/pull/4477.patch")
sha256sums=('7cb8575d88d232c77174769d7f9e24bb44444160585986eebd66e749cb9a9089'
            '6eae04e44bfab9a24ff997a3569229fcf14173733b32f764ca5962a0d773eac9')

prepare() {
  _patch_ ${pkgname^}-$pkgver
}

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
