# Maintainer: RMOlive <rmolives@wumoe.org>

pkgname=chez-scheme
pkgver=10.2.0
pkgrel=1
pkgdesc="Compiler and run-time system for the language of the Revised^6 Report on Scheme (R6RS), with numerous extensions."
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/cisco/ChezScheme"
depends=()
license=('Apache-2.0')
depends=('ncurses' 'libutil-linux')
conflicts=('petite-chez-scheme' 'chez-scheme-git')
source=(
    "https://github.com/cisco/ChezScheme/releases/download/v$pkgver/csv$pkgver.tar.gz"
    "clearcache.patch"
)
sha256sums=(
    'b795916d4cfed59240c5f44b1b507a8657efd28e62e72e134d03486e9f3e374a'
    '4cfccbfb0e0cfb8184cde827144b74c282f771cf0fb120892e1f90ca53f6d9ea'
)
_archivename=csv$pkgver

prepare() {
  _patch_ "${_archivename}"
}

build() {
  cd "$srcdir/${_archivename}"
  ./configure --installprefix=/usr --temproot=$pkgdir --threads --installschemename=chez --installscriptname=chez-script --disable-x11 CC=clang
  make
}

package() {
  cd "${srcdir}/${_archivename}"
  make install DESTDIR="$pkgdir"
}
