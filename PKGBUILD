# Maintainer: Yukari Chiba <i@0x7f.cc>

_srcname=SPIRV-LLVM-Translator
pkgname=spirv-llvm-translator
pkgver=19.1.2
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(custom)
depends=(llvm-libs spirv-tools)
makedepends=(cmake llvm-devel spirv-headers llvm-lto git)
source=(git+${url}.git#tag=v$pkgver)
sha256sums=('50e2d3b66b134b09c6ea3e0d8dcdeaf86759455c1703ecb9cd4c017a2cbe3e57')

build()
{
  cmake -B build -S ${_srcname} \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DLLVM_SPIRV_BUILD_EXTERNAL=ON \
    -DLLVM_BUILD_TOOLS=true \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=/usr/include/spirv/ \
    -Wno-dev
  make -C build
}

package()
{
  make -C build DESTDIR="${pkgdir}" install
  install -Dm755 build/tools/llvm-spirv/llvm-spirv -t "${pkgdir}"/usr/bin
  install -Dm644 ${_srcname}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
