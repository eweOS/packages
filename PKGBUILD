# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glmark2
pkgver=2023.01
pkgrel=1
pkgdesc="An OpenGL 2.0 and ES 2.0 benchmark"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/glmark2/glmark2"
license=('GPL-3.0-or-later' 'custom:SGI')
depends=('libjpeg-turbo' 'libpng' 'libgl' 'wayland')
makedepends=('meson' 'wayland-protocols' 'linux-headers')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8fece3fc323b643644a525be163dc4931a4189971eda1de8ad4c1712c5db3d67')

build() {
  ewe-meson $pkgname-$pkgver build \
    -Dflavors=drm-gl,drm-glesv2,wayland-gl,wayland-glesv2
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd $pkgname-$pkgver
  install -Dm644 COPYING.SGI -t "$pkgdir"/usr/share/licenses/$pkgname/
}
