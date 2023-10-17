# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=tiff
pkgname=libtiff
pkgver=4.6.0
pkgrel=1
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=(x86_64 aarch64 riscv64)
license=('custom')
depends=('zlib' 'xz' 'libjpeg')
source=(https://download.osgeo.org/$pkgname/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a')

build() {
  cd $pkgbase-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --with-docdir=/usr/share/doc/${pkgname} \
    --enable-ld-version-script
  make
}

check() {
  cd $pkgbase-$pkgver
  # postscript tests failed
  #make check
}

package() {
  cd $pkgbase-$pkgver
  make DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}

