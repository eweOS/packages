# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=harfbuzz
pkgver=6.0.0
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64 aarch64)
license=(MIT)
makedepends=(glib freetype2 cairo python meson icu gobject-introspection)
source=("https://github.com/harfbuzz/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('SKIP')

build() {
  # Harfbuzz wants no exceptions
  CFLAGS="${CFLAGS/-fexceptions/}"
  CXXFLAGS="${CXXFLAGS/-fexceptions/}"

  ewe-meson $pkgname-$pkgver build \
    -D chafa=disabled \
    -D docs=disabled
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

