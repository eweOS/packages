# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tllist
pkgver=1.1.0
pkgrel=2
pkgdesc='A typed linked list C header file only library'
arch=(x86_64 aarch64 riscv64)
url=https://codeberg.org/dnkl/tllist
license=(MIT)
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('3f3fe2f7433719cec816c63937a7aa36e566bd317763ef46d11562073ab6361d')

build()
{
  ewe-meson $pkgname build
}

package()
{
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
}
