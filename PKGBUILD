# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmpdclient
pkgver=2.23
pkgrel=1
pkgdesc="C library to implement a MPD client"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.musicpd.org/libs/libmpdclient/"
license=(BSD-2-Clause BSD-3-Clause)
makedepends=(meson)
provides=(libmpdclient.so)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('58367cb3e843af60f42baf12ccd6ca06f03390d88236de81130eb27c899611894fcc298afa113b248215003354b406af021e57757f4779966689617865ecc790')

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

