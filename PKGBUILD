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
  CVE-2024-47076.patch
)
sha256sums=('cbe900c7783e4aab0b1681629fad7322d82d082a51e8bae7e1c741d26bdcd294'
            'cd70a90d10881df87d1d76d44838cf15845a2deafad47391bf2cdf681c31a7d5'
            'e8305c1f9bd369fad19cd6657119edc42ffacbc19527a168507602affb2a8611')

prepare() {
  _patch_ "$pkgname-$pkgver"
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
    --disable-mutool
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
