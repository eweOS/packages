# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libgeotiff
pkgver=1.7.4
pkgrel=1
pkgdesc="A TIFF based interchange format for georeferenced raster imagery"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/OSGeo/libgeotiff"
license=(custom)
depends=(libtiff proj libjpeg-turbo zlib)
source=(https://github.com/OSGeo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c598d04fdf2ba25c4352844dafa81dde3f7fd968daa7ad131228cd91e9d3dc47')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -vfi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-jpeg=yes --with-zlib=yes
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
