# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cxxopts
pkgver=3.1.1
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(cmake)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('248e54e23564660467c7ecf50676b86d3cd10ade89e0ac1d23deb71334cb89cc5eb50f624b385d5119a43ca68ff8b1c74af82dc699b5ccfae54d6dcad4fd9447')

prepare() {
  cd $pkgname-$pkgver
  # remove clang fuzzer
  sed -i 's/Clang/Nya/g' test/CMakeLists.txt
}

build() {
  local cmake_options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_LIBDIR=lib
    -Wno-dev
    -B build
    -S $pkgname-$pkgver
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

