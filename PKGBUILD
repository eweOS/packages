# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shaderc
pkgver=2024.3
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation'
url='https://github.com/google/shaderc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache')
provides=('libshaderc_shared.so')
depends=('glslang' 'spirv-tools')
makedepends=('cmake' 'ninja' 'python' 'spirv-headers')
source=(https://github.com/google/shaderc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('ba990054b3e50bd1c3e7decaca80b80dfade0f15505f6e89c455b7a114b8507931dff2c570ca81fd38882472e7d7014c417ca8f4c1117fc0e6825ea9f669222a')

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
