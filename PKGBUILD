# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=file
pkgver=5.48
pkgrel=1
pkgdesc='File type identification utility'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
depends=('musl' 'zlib' 'xz' 'libbz2')
options=('!emptydirs')
source=("https://astron.com/pub/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ed14656883b23a364b4057c05595d93252da9bc473d30106519519d0da141283')

build()
{
  cd $pkgname-$pkgver
  CFLAGS+=" -pthread"
  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/file
  make
}

check()
{
  cd $pkgname-$pkgver
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
