# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=json-c
pkgver=0.16
pkgrel=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64)
depends=(musl)
makedepends=(cmake ninja)
provides=(libjson-c.so)
_datetag=20220414
source=(
  "https://github.com/json-c/json-c/archive/refs/tags/json-c-${pkgver}-${_datetag}.tar.gz"
  clang15.patch
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}-${_datetag}
  patch -p1 < ../clang15.patch
}

build() {
  cd ${srcdir}
  cmake -S ${pkgname}-${pkgname}-${pkgver}-${_datetag} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_THREADING=ON \
    -DENABLE_RDRAND=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

