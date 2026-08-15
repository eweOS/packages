# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcupsfilters
pkgver=2.2.1
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache')
depends=('libcups' 'libexif' 'qpdf' 'ghostscript' 'poppler' 'libjxl'
         'libjpeg' 'libpng' 'libtiff' 'lcms2' 'fontconfig' 'dbus' 'pdfio')
makedepends=('linux-headers')
checkdepends=('ttf-dejavu')
source=("https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('0a22b849d5068c4c86b20fbb4192d3faa3dabcc9ee844c8fd73710ed821d4860')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr  \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-mutool
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
