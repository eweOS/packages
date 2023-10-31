# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libglvnd
pkgver=1.7.0
pkgrel=1
pkgdesc="The GL Vendor-Neutral Dispatch library"
arch=(x86_64 aarch64 riscv64)
url="https://gitlab.freedesktop.org/glvnd/libglvnd"
license=('BSD')
makedepends=('python' 'meson')
depends=('mesa')
provides=('libgl' 'libegl' 'libgles')
source=("$url/-/archive/v$pkgver/libglvnd-v$pkgver.tar.gz")
sha512sums=('7b6eb8e075b48f1d915b892044adc3260547d74ed61d1e2fa6c5f0f8c3527754abea314181e088626d4fd58bb221085e5288c4758d828e171c7dcb0e4991745c')

build()
{
  ewe-meson $pkgname-v$pkgver build \
    -D x11=disabled \
    -D glx=disabled \
    -D gles1=false
  meson compile -C build
}

package()
{
  meson install -C build --destdir "$pkgdir"
}
