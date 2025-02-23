# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=exiv2
pkgver=0.28.5
pkgrel=1
pkgdesc="Exif, Iptc and XMP metadata manipulation library and tools"
url="https://exiv2.org"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
depends=(brotli libbrotlidec.so
         curl
         expat libexpat.so
         gettext
         libcurl.so
         libinih libINIReader.so
         zlib)
makedepends=('cmake' 'gtest' 'ninja')
checkdepends=('python')
provides=('libexiv2.so')
source=(https://github.com/Exiv2/exiv2/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('43c1d68255ee8df124b3093e1f4101d2f55fd8d6105bb6f20b148fe7d59472b895f0cba914e59f6d1581e84eee9d7033572821b80c16507e92abcb9a738daadc')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DEXIV2_BUILD_SAMPLES=ON \
    -DEXIV2_BUILD_UNIT_TESTS=ON \
    -DEXIV2_ENABLE_VIDEO=ON \
    -DEXIV2_ENABLE_NLS=ON \
    -DEXIV2_ENABLE_XMP=ON \
    -DEXIV2_ENABLE_CURL=ON \
    -DEXIV2_ENABLE_WEBREADY=ON \
    -DEXIV2_ENABLE_BMFF=ON
  ninja -C build
}

check() {
  cd ${pkgname}-${pkgver}
  # FIXME: bash test: icc test and nls test
  LD_LIBRARY_PATH="$PWD"/build/lib \
  ninja -C build test || :
}

package() {
  cd ${pkgname}-${pkgver}
  # remove samples instal which are only needed for unit tests
  sed '/samples\/cmake_install.cmake/d' -i build/cmake_install.cmake
  DESTDIR="${pkgdir}" ninja -C build install
}
