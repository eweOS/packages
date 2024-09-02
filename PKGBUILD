# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmpdclient
pkgver=2.22
pkgrel=1
pkgdesc="C library to implement a MPD client"
arch=(x86_64 aarch64 riscv64)
url="https://www.musicpd.org/libs/libmpdclient/"
license=(BSD-2-Clause BSD-3-Clause)
makedepends=(meson)
provides=(libmpdclient.so)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('6dcf2f822cbe3a3bea145fff7edb9185951f83e39ee9794a6e420af1f9680e04bbf67b62458560c13b626201024c0bb59e330dfa91bec0fcd527da8de5127022')

build() {
  ewe-meson build "$pkgname-$pkgver"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -vdm 755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sv "/usr/share/doc/$pkgname/BSD-2-Clause.txt" "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "/usr/share/doc/$pkgname/BSD-3-Clause.txt" "$pkgdir/usr/share/licenses/$pkgname/"
}

