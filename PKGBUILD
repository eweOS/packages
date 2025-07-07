# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland
pkgver=1.24.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'libffi' 'expat' 'libxml2')
makedepends=('meson')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('82892487a01ad67b334eca83b54317a7c86a03a89cfadacfef5211f11a5d0536')

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
