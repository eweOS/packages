# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=shaderc
pkgver=2025.3
pkgrel=1
pkgdesc='Collection of tools, libraries and tests for shader compilation'
url='https://github.com/google/shaderc'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache')
provides=('libshaderc_shared.so')
depends=('glslang' 'spirv-tools')
makedepends=('cmake' 'ninja' 'python' 'spirv-headers')
# 0001: Downstream fix (should be upstreamed), glslang 15.2.0 (although
# accidentally) dropped the libSPIRV.so stub.
source=(https://github.com/google/shaderc/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
	0001-Do-not-link-to-stub-libSPIRV.so.patch)
sha512sums=('4d4f0d7c37d3224e6fb38b320f1ab52e4feb2e5a1c630973c1f00171d90d8d66bef3e44faf996ec67e1568fafc7f767e147fa130d5919b05aad55a78fca7f101'
            'b1fbdeadf3f75626297f70c59de37b86eaef9fdfb54b99b6be68d6581900a45d93ea6fc50183e82a037783fdc6a8433c09191e69271b7f6d98b15f0ff2aeb8a6')

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

  _patch_ ${pkgname}-${pkgver}
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
