# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcupsfilters
pkgver=2.1.0
pkgrel=1
pkgdesc="OpenPrinting CUPS Filters - contains all the code of the filters of the former cups-filters package as library functions"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/OpenPrinting/libcupsfilters"
license=('Apache')
depends=('libcups' 'libexif' 'qpdf' 'ghostscript' 'poppler'
         'libjpeg' 'libpng' 'libtiff' 'lcms2' 'fontconfig' 'dbus')
makedepends=('linux-headers')
checkdepends=('ttf-dejavu')
source=(
  "https://github.com/OpenPrinting/libcupsfilters/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"
  c++11.patch
)
sha256sums=('cbe900c7783e4aab0b1681629fad7322d82d082a51e8bae7e1c741d26bdcd294'
            '535d1b97655de4339cf59a38260c5c2892728aede037e76f25710d4cfb96afdd')

prepare() {
  _patch_ "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # avoid duplicate mkdir
  sed -i 's/-mkdir/-mkdir -p/' install-sh
}

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
