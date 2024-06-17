# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=jxrlib
pkgver=0.2.4
pkgrel=1
pkgdesc="Open source implementation of jpegxr"
arch=(x86_64 aarch64 riscv64)
url="https://archive.codeplex.com/?p=jxrlib"
license=('GPL')
makedepends=('cmake')
source=(https://github.com/glencoesoftware/jxrlib/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        CMakeLists.txt)
sha256sums=('324af02e341bcb9e3b31a6d6892f47231f95f9f87ab4fe7645be619dcaf965a7'
            'e74e90e05a7b0b60b4d0d0900cf680d77eddf534a0241c0213be54d39671d433')

prepare() {
  cp CMakeLists.txt $pkgname-$pkgver/
  cd $pkgname-$pkgver
  sed -i 's/_byteswap_ulong/__builtin_bswap32/' image/decode/segdec.c
  sed -i '1i #include <wchar.h>' jxrgluelib/JXRGlueJxr.c
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
