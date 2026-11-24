# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libssh
pkgver=0.12.2
pkgrel=1
pkgdesc='Library for accessing SSH client services'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.libssh.org/'
license=(LGPL-2.1-or-later)
depends=(openssl
         zlib)
makedepends=(cmake
             ninja)
checkdepends=(cmocka)
provides=(libssh.so)
source=("https://www.libssh.org/files/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha256sums=('49560f677d96e3706a904ac2de1116e25f3680937d51e5c92198fcba4a1c1e9f')

build() {
  cmake -B build -S "$pkgname-$pkgver" -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_BUILD_TYPE=None \
    -DWITH_GSSAPI=OFF \
    -DUNIT_TESTING=ON
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ "$srcdir/$pkgname-$pkgver/COPYING"
}
