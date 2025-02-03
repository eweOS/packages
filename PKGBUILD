# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpng
pkgver=1.6.46
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib' 'sh')
provides=('libpng16.so')
source=(
  "https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz"
  apng.patch.gz::https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-1.6.43-apng.patch.gz
)
sha256sums=('f3aa8b7003998ab92a4e9906c18d19853e999f9d3bca9bd1668f54fa81707cb1'
            'd107579e90d55386d00e6086ea750942f22a04b9ab476bba0c660770cefafe22')

prepare()
{
  cd $pkgname-$pkgver
  patch -p1 < $srcdir/*.patch
}

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-static
  make
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd contrib/pngminus
  make PNGLIB_SHARED="-L$pkgdir/usr/lib -lpng" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS" CC=clang HOSTCC=clang png2pnm pnm2png
  install -m0755 png2pnm pnm2png "$pkgdir/usr/bin/"
}
