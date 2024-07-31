# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcupsfilters
pkgver=2.0.0
pkgrel=2
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache')
depends=('libcups' 'libexif' 'qpdf' 'ghostscript'
         'libjpeg' 'libpng' 'libtiff' 'lcms2' 'fontconfig' 'dbus')
makedepends=('linux-headers')
checkdepends=('ttf-dejavu')
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601')

prepare() {
  cd "$pkgname"-$pkgver
  # avoid duplicate mkdir
  sed -i 's/-mkdir/-mkdir -p/' install-sh
}

build() {
  cd "$pkgname"-$pkgver

  case $CARCH in
    aarch64)
      export CFLAGS="$CFLAGS -mno-outline-atomics"
      export CXXFLAGS="$CXXFLAGS -mno-outline-atomics" ;;
  esac

  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool \
    --disable-poppler
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "$pkgname"-$pkgver
  make check
}

package() {
  cd "$pkgname"-$pkgver
  make DESTDIR="$pkgdir/" install
}
