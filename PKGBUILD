# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=harfbuzz
pkgver=8.4.0
pkgrel=2
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(glib freetype2 cairo icu)
makedepends=(python meson gobject-introspection)
source=("https://github.com/harfbuzz/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
provides=(libharfbuzz-subset.so libharfbuzz-cairo.so libharfbuzz.so
	  libharfbuzz-icu.so libharfbuzz-gobject.so)
sha256sums=('af4ea73e25ab748c8c063b78c2f88e48833db9b2ac369e29bd115702e789755e')

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

