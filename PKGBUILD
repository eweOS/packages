# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nlohmann-json
pkgver=3.12.0
pkgrel=1
# tests are tracked in a separate repo
# https://github.com/nlohmann/json_test_data
_test_pkgver=3.1.0
pkgdesc="JSON for Modern C++"
arch=(any)
url="https://github.com/nlohmann/json"
license=(MIT)
makedepends=(cmake git)
source=(
  "$pkgname::git+https://github.com/nlohmann/json#tag=v$pkgver"
  "json_test_data-$_test_pkgver.tar.gz::https://github.com/nlohmann/json_test_data/archive/v$_test_pkgver.tar.gz"
  "fix-musl.patch"
)
sha256sums=('4f0ead690fc5ae3b9aaf789a71fba5f01dc65bd0881001e6ed6c129236f3a821'
            '884b1e21f38cfd6a62c159f1b7e0a8f5168ae5daaa384ed4dc0c0fa6660f21bd'
            'bb9f5d2f8ecc9f642918c858c11f0015066521f16bdf267dec06137797a6a71c')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  # https://github.com/nlohmann/json/issues/4767
  _patch_ $pkgname
  mkdir -vp build-test/
  mv -v json_test_data-${_test_pkgver}/ build-test/json_test_data/
}

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=/usr/lib
    -D JSON_MultipleHeaders=ON
    -S $pkgname
    -W no-dev
  )
  local cmake_test_options=(
    "${cmake_options[@]}"
    -D BUILD_TESTING=ON
    -D JSON_BuildTests=ON
    -B build-test
  )

  cmake "${cmake_options[@]}"
  cmake --build build --verbose

  cmake "${cmake_test_options[@]}"
  cmake --build build-test --verbose
}

check() {
  ctest --test-dir build-test --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname/README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgname/LICENSE.MIT -t "$pkgdir/usr/share/licenses/$pkgname/"
}

