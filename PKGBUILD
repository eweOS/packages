# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tllist
pkgver=1.1.0
pkgrel=1
pkgdesc='A typed linked list C header file only library'
arch=(x86_64 aarch64 riscv64)
url=https://codeberg.org/dnkl/tllist
license=(MIT)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0e7b7094a02550dd80b7243bcffc3671550b0f1d8ba625e4dff52517827d5d23')

build()
{
  ewe-meson $pkgname build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
}
