# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qcoro
pkgver=0.13.0
pkgrel=3
pkgdesc='C++ Coroutines for Qt'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/danvratil/qcoro'
license=(MIT)
depends=(qt6-base
         qt6-declarative
         qt6-websockets)
makedepends=(cmake
             qt6-declarative-devel
             git)
conflicts=(qcoro-qt6)
provides=(qcoro-qt6)
replaces=(qcoro-qt6)
source=(git+https://github.com/danvratil/qcoro#tag=v$pkgver)
sha256sums=('f6a2d1b8d85a7f9698385aacb0f11038e6b439450b88b51d8397280c6347c24b')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgbase/LICENSES/MIT.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
