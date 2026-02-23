# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libpng
pkgver=1.6.55
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
sha256sums=('d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d'
            '017c06f75ffed25f6cda9b5369ec6da0ac35a6616adf7abe4222516a0237f37a')

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
