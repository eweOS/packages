# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cairo
pkgver=1.28.0
pkgrel=1
pkgdesc="Python bindings for the cairo graphics library"
url="https://pycairo.readthedocs.io/en/latest/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL2.1 MPL)
depends=(cairo python)
makedepends=(meson)
checkdepends=(python-pytest)
source=(https://github.com/pygobject/pycairo/releases/download/v$pkgver/pycairo-$pkgver.tar.gz)
sha256sums=('26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc')

build() {
  ewe-meson pycairo-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir="$pkgdir"

  # compile Python bytecode
  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"
}
