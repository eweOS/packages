# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=gdbm
pkgver=1.26
pkgrel=1
pkgdesc="GNU database library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gnu.org/software/gdbm/gdbm.html"
license=(GPL-3.0-or-later)
depends=(musl readline)
provides=(libgdbm_compat.so libgdbm.so)
source=("https://ftp.gnu.org/gnu/gdbm/$pkgname-$pkgver.tar.gz")
sha512sums=('44aafe254f0950a8f5215d8f1337674f07b19f2a375f6eb19a7e39690028c80c3774b705c2b76b470ae74042b21f2ca77d02f6f57aa2ee50296db801220a3352')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
    --enable-libgdbm-compat
  make
}

check() {
  make check -C $pkgname-$pkgver
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{NOTE-WARNING,AUTHORS,NEWS,README,ChangeLog} -t "$pkgdir/usr/share/doc/$pkgname"
}
