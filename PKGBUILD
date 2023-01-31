# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libepoxy
pkgver=1.5.10
pkgrel=1
pkgdesc="Library handling OpenGL function pointer management"
url="https://github.com/anholt/libepoxy"
arch=(x86_64 aarch64)
license=(MIT)
makedepends=(meson mesa)
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  ewe-meson $pkgname-$pkgver build \
    -Ddocs=false \
    -Degl=yes \
    -Dx11=false \
    -Dtests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 $pkgname-$pkgver/COPYING
}
