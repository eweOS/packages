# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=wayland
pkgname=wayland
pkgver=1.21.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=('x86_64')
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'libffi' 'expat' 'libxml2')
makedepends=('meson')
options=('debug')
source=("https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.21.0/downloads/wayland-$pkgver.tar.xz")
sha256sums=('SKIP')

build() {
  # Do not build doc since doxygen and graphviz not available
  ewe-meson $pkgbase-$pkgver build -Ddocumentation=false
  meson compile -C build
}

package() {
  provides=(libwayland-{client,cursor,egl,server}.so)

  meson install -C build --destdir "$pkgdir"
  install -Dm 644 $pkgbase-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
