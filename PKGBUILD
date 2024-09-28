# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-utils-cxx
pkgver=1.0.1
pkgrel=1
pkgdesc='Implementation of the FreeDesktop specifications to be used in C++ projects'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/azubieta/xdg-utils-cxx'
license=(MIT)
makedepends=(cmake git)
source=(git+https://github.com/azubieta/xdg-utils-cxx#tag=v$pkgver)
sha256sums=('a2bdc431c6962ff4e8c5be06c8355ce0b212e3f3e79c8ef1ebff5ef280e2ab5c')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

