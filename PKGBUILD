# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libclc
pkgver=20.1.7
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('cmake' 'ninja' 'python' 'spirv-llvm-translator' 'llvm-devel')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/libclc-$pkgver.src.tar.xz)
sha256sums=('22b29c1a9f18d8744e5a24f36ce6d4f198d523c126cd7182569c73806e1e1854')

prepare() {
  cd $pkgname-$pkgver.src
  mkdir build
}

build() {
  cd $pkgname-$pkgver.src/build

  cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_LINK_LLVM_DYLIB=ON \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd $pkgname-$pkgver.src/build

  DESTDIR="$pkgdir" ninja install
  install -Dm644 ../LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
