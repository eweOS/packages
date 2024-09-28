# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libebur128
pkgver=1.2.6
pkgrel=1
pkgdesc='A library that implements the EBU R 128 standard for loudness normalisation'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/jiixyj/libebur128'
license=(MIT)
makedepends=(cmake
             git)
source=(git+https://github.com/jiixyj/libebur128#tag=v$pkgver)
sha256sums=('ee74f29f3f4d339f71de831af341b36d2cf24d0129e5bec0512b145d66da3daf')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

