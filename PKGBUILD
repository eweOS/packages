# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cxxopts
pkgver=3.3.1
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(cmake)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('a22da1436a263d51aad2f542c2099f5b4fd1b02674716ff26d2f575786dcec4e97400edebf5577de95f3ae48c7c99be7be17d7a3de3e01a9f3612667e1547908')

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

