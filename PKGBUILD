# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=file
pkgver=5.46
pkgrel=2
pkgdesc='File type identification utility'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
depends=('musl' 'zlib' 'xz' 'libbz2')
options=('!emptydirs')
source=("https://astron.com/pub/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c9cc77c7c560c543135edc555af609d5619dbef011997e988ce40a3d75d86088')

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
