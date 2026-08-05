# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgbase=librime
pkgname=($pkgbase $pkgbase-doc)
pkgver=1.17.0
pkgrel=1
pkgdesc='Rime Input Method Engine'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://rime.im
license=(BSD-3-Clause)
depends=(boost-libs leveldb libmarisa llvm-libs musl opencc yaml-cpp)
makedepends=(cmake boost doxygen googletest ninja)
source=($pkgbase-$pkgver.tar.gz::https://github.com/rime/$pkgbase/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(a60274da5d8b8a7187e6c7e9ba5023334ed7bdd182535e93c4e96de8cf188377)

build() {
  local cmake_vars=(
    CMAKE_INSTALL_PREFIX=/usr
    ENABLE_LOGGING=OFF
  )
  cmake -S $pkgbase-$pkgver -B build ${cmake_vars[@]/#/-D} -G Ninja -Wno-dev
  cmake --build build

  cd $pkgbase-$pkgver/doc
  doxygen Doxyfile
}

check() {
  ctest --output-on-failure --test-dir build
}

package_librime() {
  provides=($pkgname.so)

  DESTDIR="$pkgdir" cmake --install build
  _install_license_ $pkgbase-$pkgver/LICENSE
}

package_librime-doc() {
  pkgdesc+=' (Documentation)'

  install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgbase $pkgbase-$pkgver/doc/html/*
}
