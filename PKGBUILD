# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmpdclient
pkgver=2.26
pkgrel=1
pkgdesc="C library to implement a MPD client"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.musicpd.org/libs/libmpdclient/"
license=(BSD-2-Clause BSD-3-Clause)
makedepends=(meson)
provides=(libmpdclient.so)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('49ea27edf5f11618f708d3589535f74c3b50c44c952bd4d66bcdbac5792f4c5fe8de798d3e027fb15154812898a6f7749898e59c839ab62c1a3f22d4597151ab')

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

