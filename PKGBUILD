# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayland
pkgver=1.22.0
pkgrel=1
pkgdesc='A computer display server protocol'
arch=(x86_64 aarch64)
url='https://wayland.freedesktop.org/'
license=('MIT')
depends=('musl' 'libffi' 'expat' 'libxml2')
makedepends=('meson')
options=('debug')
source=("https://gitlab.freedesktop.org/wayland/$pkgname/-/releases/$pkgver/downloads/$pkgname-$pkgver.tar.xz")
sha256sums=('1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842')

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
