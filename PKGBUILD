# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libclc
pkgver=15.0.6
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('cmake' 'ninja' 'python' 'spirv-llvm-translator')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/libclc-$pkgver.src.tar.xz)
sha256sums=('f5eb63103557652f96fd40d2a49a9ccb184e08966ec9d89a2e53440120ad1f4c')

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
