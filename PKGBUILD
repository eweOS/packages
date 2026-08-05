# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgbase=leveldb
pkgname=($pkgbase $pkgbase-doc)
pkgver=1.23
pkgrel=1
pkgdesc='A fast key-value storage library written at Google that provides an ordered mapping from string keys to string values.'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/google/leveldb
license=(BSD-3-Clause)
depends=(llvm-libs musl)
makedepends=(benchmark cmake googletest ninja sqlite)
# This patches are from downstream.
# 0001: Unbundle googletest and benchmark
source=(
  $pkgbase-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz
  0001-unbundle-googletest-and-benchmark.patch
)
sha256sums=(
  9a37f8a6174f09bd622bc723b55881dc541cd50747cbd08831c2a82d620f6d76
  c65ab11d2f431f4d5bf6f6c5d800d7f7382e1cc44af3917322f0b4182820babb
)

prepare() {
  _patch_ $pkgbase-$pkgver
}

build() {
  local cmake_vars=(
    CMAKE_INSTALL_PREFIX=/usr
    BUILD_SHARED_LIBS=ON
    HAVE_KYOTOCABINET=OFF
  )
  cmake -S $pkgbase-$pkgver -B build ${cmake_vars[@]/#/-D} -G Ninja
  cmake --build build
}

check() {
  ctest --output-on-failure --test-dir build
}

package_leveldb() {
  provides=(lib$pkgbase.so)

  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgbase-$pkgver/LICENSE
}

package_leveldb-doc() {
  pkgdesc+=' (Documentation)'

  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgbase $pkgbase-$pkgver/doc/*
}
