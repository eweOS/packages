# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libclc
pkgver=19.1.6
pkgrel=1
pkgdesc="Library requirements of the OpenCL C programming language"
arch=('any')
url="https://libclc.llvm.org/"
license=('MIT')
makedepends=('cmake' 'ninja' 'python' 'spirv-llvm-translator' 'llvm-devel')
_source_base=https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver
source=($_source_base/libclc-$pkgver.src.tar.xz)
sha256sums=('9fb7807c245b265cc1158105a52abaf8199a13834e2d2e94d742ce436a1e82d7')

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
