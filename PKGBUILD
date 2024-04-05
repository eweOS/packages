# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpng
pkgver=1.6.43
pkgrel=1
pkgdesc="A collection of routines used to create PNG format graphics files"
arch=(x86_64 aarch64 riscv64)
url="http://www.libpng.org/pub/png/libpng.html"
license=('custom')
depends=('zlib' 'sh')
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz")
sha256sums=('6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c')

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
