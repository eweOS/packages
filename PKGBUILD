# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shaderc
pkgver=2023.8
pkgrel=2
pkgdesc='Collection of tools, libraries and tests for shader compilation'
url='https://github.com/google/shaderc'
arch=(x86_64 aarch64 riscv64)
license=('Apache')
provides=('libshaderc_shared.so')
depends=('glslang' 'spirv-tools')
makedepends=('cmake' 'ninja' 'python' 'spirv-headers')
source=(https://github.com/google/shaderc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('2a5e59a2bb6c4b5462758d824747fee0edaf177dc64f30fe698fd2d2cc21cddab1a19ec2b2d63bd3d2e209330a13519f399395398379370b15daa39e6ee6b2bf')

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
