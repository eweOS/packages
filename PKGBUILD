# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shaderc
pkgver=2024.1
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation'
url='https://github.com/google/shaderc'
arch=(x86_64 aarch64 riscv64)
license=('Apache')
provides=('libshaderc_shared.so')
depends=('glslang' 'spirv-tools')
makedepends=('cmake' 'ninja' 'python' 'spirv-headers')
source=(https://github.com/google/shaderc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('017d8625c66da7eb5b431f595b27a4ddf146aaa12ef56777cb8c3f7f0f15eb01c3286e5905c5268de55d07cc19d5ffae4d4c08987d105b0a6be74616a467b736')

prepare() {
  cd ${pkgname}-${pkgver}

  # de-vendor libs and disable git versioning
  sed '/examples/d;/third_party/d' -i CMakeLists.txt
  sed '/build-version/d' -i glslc/CMakeLists.txt
  cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF

  # fix missing PYTHON_EXECUTABLE
  sed -i 's@${PYTHON_EXECUTABLE}@python@' glslc/test/CMakeLists.txt
}

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -B build \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DSHADERC_SKIP_TESTS=ON \
    -Dglslang_SOURCE_DIR=/usr/include/glslang
  ninja -C build
}

check() {
  cd ${pkgname}-${pkgver}
  ninja -C build test
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install

  # Remove unused shaderc_static.pc
  rm "${pkgdir}/usr/lib/pkgconfig/shaderc_static.pc"
}
