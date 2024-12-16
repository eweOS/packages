# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libnsl
pkgver=2.0.1
pkgrel=1
pkgdesc="Public client interface library for NIS(YP)"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/thkukuk/libnsl"
license=(LGPL-2.1-only)
depends=(libtirpc)
provides=(libnsl.so)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('1d9290c3123c0933f156808c388654698f7d6994c625cbbc492cc07d656b996c62847048b14b93b8eda632945096ace418a3418ee1f40ff2cc748a3278f987a4')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,NEWS,README} -t "$pkgdir/usr/share/doc/$pkgname/"
}
