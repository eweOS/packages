# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpng
pkgver=1.6.58
pkgrel=2
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
sha256sums=('28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775'
            'eee7dea22ed502868017971c86c63c4ed1e6085de0baebfdcc3d3322f00f3eb0')

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
