# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=zstd
pkgver=1.6.0
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm'
url='https://facebook.github.io/zstd/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause GPL-2.0-only)
depends=(zlib xz lz4)
makedepends=(cmake ninja)
provides=(libzstd.so)
# 0001: Revert, workaround deadloop on riscv64
source=("https://github.com/facebook/zstd/releases/download/v${pkgver}/zstd-${pkgver}.tar.gz"
	"0001-riscv-Enable-support-for-weak-symbols.patch")
sha256sums=('2ba599ae2a257976278e7e71e998433a387bfd18aa7b78678229fd5d84f5e9b8'
            '2e72f640936d738adffe2c9dc4b136cd8ebea6b0ba7a41b922f3c5580cbd30c0')

prepare()
{
  cd ${pkgname}-${pkgver}
  # avoid error on tests without static libs, we use LD_LIBRARY_PATH
  sed '/if(ZSTD_BUILD_TESTS AND NOT ZSTD_BUILD_STATIC)/,/endif()/d' \
    -i build/cmake/CMakeModules/ZstdBuild.cmake
  sed 's/libzstd_static/libzstd_shared/g' -i build/cmake/tests/CMakeLists.txt
  patch -Rp1 < "$srcdir/0001-riscv-Enable-support-for-weak-symbols.patch"
}

build()
{
  cd ${pkgname}-${pkgver}
  export CFLAGS+=' -ffat-lto-objects'
  export CXXFLAGS+=' -ffat-lto-objects'

  cmake -S build/cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DZSTD_ZLIB_SUPPORT=ON \
    -DZSTD_LZMA_SUPPORT=ON \
    -DZSTD_LZ4_SUPPORT=ON \
    -DZSTD_BUILD_CONTRIB=ON \
    -DZSTD_BUILD_STATIC=OFF \
    -DZSTD_BUILD_TESTS=ON \
    -DZSTD_PROGRAMS_LINK_SHARED=ON
  cmake --build build
}

check()
{
  cd ${pkgname}-${pkgver}

  # only run fullbench for faster packaging
  LD_LIBRARY_PATH="$PWD/build/lib" \
  	ctest -VV -R fullbench --test-dir build
}

package()
{
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" cmake --install build
  ln -sf /usr/bin/zstd "${pkgdir}/usr/bin/zstdmt"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
