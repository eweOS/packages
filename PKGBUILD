# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=sdbus-cpp
pkgver=2.1.0
pkgrel=1
pkgdesc='a high-level C++ D-Bus library designed to provide expressive, easy-to-use API'
url="https://github.com/Kistler-Group/$pkgname"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-only LicenseRef-sdbus-c++-LGPL-Exception-1.0)
depends=(expat basu)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6025e5dc6cddd532ff960d14e68ced5f42a1916b23a73fea6bcb437f06992eaf')

build() {
  cmake -B build -S "$_archive" \
    -D CMAKE_INSTALL_PREFIX=/ \
    -D CMAKE_BUILD_TYPE=Release \
    -D SDBUSCPP_SDBUS_LIB=basu \
    -D BUILD_CODE_GEN=ON \
    -D BUILD_DOXYGEN_DOC=OFF
  cmake --build build
}

package() {
  provides=(libsdbus-c++.so)
    
  DESTDIR="$pkgdir" cmake --install build
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgbase/" "$_archive/COPYING"*
}
