# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmpdclient
pkgver=2.27
pkgrel=1
pkgdesc="C library to implement a MPD client"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.musicpd.org/libs/libmpdclient/"
license=(BSD-2-Clause BSD-3-Clause)
makedepends=(meson)
provides=(libmpdclient.so)
source=("https://www.musicpd.org/download/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz")
sha512sums=('53e57d272d860faf1b508f419baf1697785cace0788b5d873a53c7675fd7c2b8b700c49cacf13604b84c0098eb51ff24de5ebcae08ea92917f93b9aaca5c38c9')

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

