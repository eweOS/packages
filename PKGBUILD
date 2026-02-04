# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpng
pkgver=1.6.53
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib' 'sh')
provides=('libpng16.so')
source=(
  "https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz"
  apng.patch.gz::https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-$pkgver-apng.patch.gz
)
sha256sums=('1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4'
            '452a1a290bd0cf18737fad0057dc17b7fdf10a73eda2d6d4f31ba04fda25ef2c')

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
