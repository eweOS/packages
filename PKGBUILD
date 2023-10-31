# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=json-c
pkgver=0.17
pkgrel=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
makedepends=(cmake ninja)
provides=(libjson-c.so)
_datetag=20230812
source=(
  "https://github.com/json-c/json-c/archive/refs/tags/json-c-${pkgver}-${_datetag}.tar.gz"
)
sha256sums=('024d302a3aadcbf9f78735320a6d5aedf8b77876c8ac8bbb95081ca55054c7eb')

build()
{
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

package()
{
  DESTDIR="$pkgdir" cmake --install build
}
