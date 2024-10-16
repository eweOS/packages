# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libgeotiff
pkgver=1.7.3
pkgrel=1
pkgdesc="A TIFF based interchange format for georeferenced raster imagery"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/OSGeo/libgeotiff"
license=(custom)
depends=(libtiff proj libjpeg-turbo zlib)
source=(https://github.com/OSGeo/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('ba23a3a35980ed3de916e125c739251f8e3266be07540200125a307d7cf5a704')

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
