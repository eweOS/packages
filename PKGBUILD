# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cxxopts
pkgver=3.2.1
pkgrel=1
pkgdesc="Lightweight C++ command line option parser"
arch=(any)
url="https://github.com/jarro2783/cxxopts"
license=(MIT)
makedepends=(cmake)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('7841fb3e6c3c2a057917c962e29fc0090e6ed06f5515aaa5e2a868fef59071a9a99b74d81c32cf613ecf10a68a4d96d6ad07805f48c7c3951ded096a2317dc3d')

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

