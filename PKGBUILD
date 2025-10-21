# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glmark2
pkgver=2023.01
pkgrel=2
pkgdesc="An OpenGL 2.0 and ES 2.0 benchmark"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://github.com/glmark2/glmark2"
license=('GPL-3.0-or-later' 'custom:SGI')
depends=('libjpeg-turbo' 'libpng' 'libgl' 'wayland')
makedepends=('meson' 'wayland-protocols' 'linux-headers')
# 0001: Under review, fix glmark2-wayland fails to load OpenGL library, since
#	eweOS ships no X11-dependent libGL.so.
#	https://github.com/glmark2/glmark2/pull/255
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"0001-GLStateEGL-Also-try-loading-libOpenGL.so-as-OpenGL-l.patch")
sha256sums=('8fece3fc323b643644a525be163dc4931a4189971eda1de8ad4c1712c5db3d67'
            '3981eefee56593cee52337cebbb48918ff7e1d1313af5b03095ff702a4f568b3')

prepare() {
  _patch_ $pkgname-$pkgver
}

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
