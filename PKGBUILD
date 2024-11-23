# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=qhull
pkgver=2020.2
_pkgver=8.0.2
pkgrel=1
pkgdesc='A general dimension code for computing convex hulls and related structures'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.qhull.org/'
license=(LicenseRef-qhull)
makedepends=(cmake)
source=(http://www.qhull.org/download/qhull-${pkgver%.*}-src-$_pkgver.tgz)
sha256sums=('b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -ffat-lto-objects" \
    -DCMAKE_SKIP_RPATH=ON
  cmake --build build
  cmake --build build --target libqhull # deprecated, needed by octave
}

package() { 
  DESTDIR="$pkgdir" cmake --install build
  cp -P build/libqhull.so* "$pkgdir"/usr/lib/

  # Install license
  install -Dm644 "$srcdir"/$pkgname-$pkgver/COPYING.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
