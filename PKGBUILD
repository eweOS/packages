# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libclc
pkgver=14.0.6
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('cmake' 'ninja' 'python' 'spirv-llvm-translator')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/libclc-$pkgver.src.tar.xz)
sha256sums=('c9b183160ec093b4bd4a24517ab97b30110418b8d904a849c415dc647b345f95')

prepare() {
  cd $pkgname-$pkgver.src
  mkdir build
}

build() {
  cd $pkgname-$pkgver.src/build

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCLANG_LINK_CLANG_DYLIB=ON \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_LLVM_SHARED=1
  ninja
}

package() {
  cd $pkgname-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
