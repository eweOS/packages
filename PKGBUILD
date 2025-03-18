# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yajl
pkgver=2.1.0
pkgrel=1
pkgdesc='Yet Another JSON Library'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/lloyd/yajl"
license=(ISC)
makedepends=(cmake)
provides=(libyajl.so)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  $pkgname-2.1.0-CVE-2017-16516.patch
  $pkgname-2.1.0-CVE-2022-24795.patch
  $pkgname-2.1.0-memory_leak.patch
)
sha512sums=('9e786d080803df80ec03a9c2f447501e6e8e433a6baf636824bc1d50ecf4f5f80d7dfb1d47958aeb0a30fe459bd0ef033d41bc6a79e1dc6e6b5eade930b19b02'
            '6955d317643e0a0e0893e62acd8485ce9b5d22837faa4eadf9abe09e72fc4cc1a343edd1faaff75e7172063bdb0e9442cb5e3f491ec2cc4d770fcbcb011d6dae'
            '75cac72797a694a044e83e03ab1a25d3cce376355d48214f6cdc8f4304776c1fd3b411d043e0e48022b219b00399f2bc730fe58b9e60737ef3ff66be54229722'
            'a23e30a0c42097f41f1a0bc769a9c68409a615a4599ae9f090320d4413e24c4f1b524aaabcefd9e503bbb7389aaef86fe32cbfdc93969e883225dcdf487b7214')
prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -S $pkgname-$pkgver
    -W no-dev
  )

  if check_option lto y; then
    export CFLAGS+=" -ffat-lto-objects"
  fi
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  make VERBOSE=1 -C build test
  make VERBOSE=1 -C build test-api
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{ChangeLog,README,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
