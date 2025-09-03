# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gpgmepp
pkgver=2.0.0
pkgrel=1
pkgdesc='C++ bindings for GPGME'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://gnupg.org/software/gpgme/index.html'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         gpgme
         libgpg-error)
makedepends=(cmake
             git)
provides=(libgpgmepp.so)
conflicts=('gpgme<2')
source=(git+https://dev.gnupg.org/source/gpgmepp#tag=gpgmepp-$pkgver)
sha256sums=('94d24543dcdbfb6e6625d0a9852dd318e4af198ae0b70bdad092634d0aa864c0')

build() {
  cmake -B build -S $pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
