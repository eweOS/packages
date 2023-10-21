# Maintainer: Yukari Chiba <i@0x7f.cc>

_srcname=SPIRV-LLVM-Translator
pkgname=spirv-llvm-translator
pkgver=16.0.0
pkgrel=1
pkgdesc="Tool and a library for bi-directional translation between SPIR-V and LLVM IR"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/KhronosGroup/SPIRV-LLVM-Translator"
license=(custom)
depends=(llvm-libs spirv-tools)
makedepends=(cmake llvm spirv-headers openmp llvm-lto)
_commit=322fca5d9c59bfdb80562a52ace51cdbe2a60e92
source=(git+${url}.git#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd ${_srcname}
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./;s/-/+/'
}

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
