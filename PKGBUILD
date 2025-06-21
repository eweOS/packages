# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland
pkgver=1.23.92
pkgrel=1
pkgdesc='A computer display server protocol'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'libffi' 'expat' 'libxml2')
makedepends=('meson')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('c12b5b7eab64b0b4ffb98d39fe21cbaaf4b315ea51f34998344b5ff87a72a887')

build()
{
  # Do not build doc since doxygen and graphviz not available
  ewe-meson $pkgname-$pkgver build -Ddocumentation=false
  meson compile -C build
}

package()
{
  provides=(libwayland-{client,cursor,egl,server}.so)

  meson install -C build --destdir "$pkgdir"
  install -Dm 644 $pkgname-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
