# Maintainer: RMOlive <rmolives@wumoe.org>

pkgname=chez-scheme
pkgver=10.4.1
pkgrel=1
pkgdesc="Compiler and runtime for R6RS release of Scheme"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/cisco/ChezScheme"
license=('Apache-2.0')
depends=('musl' 'ncurses' 'libutil-linux')
source=(
    "https://github.com/cisco/ChezScheme/releases/download/v$pkgver/csv$pkgver.tar.gz"
)
sha256sums=('2e74952db7bc177f0c3602e2217a341ba677d733eec4cd7726418c3a4e1ef308')
_archivename=csv$pkgver

build() {
  cd "$srcdir/${_archivename}"
  # CC needs to be passed in, otherwise gcc will be used by default.
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script --disable-x11 CC=clang
  make
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
