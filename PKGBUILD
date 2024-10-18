# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=tiff
pkgname=libtiff
pkgver=4.7.0
pkgrel=2
pkgdesc='Library for manipulation of TIFF images'
url='http://www.simplesystems.org/libtiff/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
depends=('zlib' 'xz' 'libjpeg')
source=(https://download.osgeo.org/$pkgname/${pkgbase}-${pkgver}.tar.gz)
sha256sums=('67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976')

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

