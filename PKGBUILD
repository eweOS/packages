# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=fribidi
pkgver=1.0.12
pkgrel=1
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm"
url="https://github.com/fribidi/fribidi/"
arch=(x86_64)
license=(LGPL)
depends=(musl)
makedepends=(meson)
provides=(libfribidi.so)
source=("https://github.com/fribidi/fribidi/releases/download/v1.0.12/fribidi-${pkgver}.tar.xz")
sha256sums=('SKIP')

build() {
  ewe-meson $pkgname-$pkgver build \
    -D docs=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
