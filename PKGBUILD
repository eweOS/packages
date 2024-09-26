# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=harfbuzz
pkgver=10.0.1
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(glib freetype2 cairo icu)
makedepends=(python meson gobject-introspection)
source=("https://github.com/harfbuzz/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
provides=(libharfbuzz-subset.so libharfbuzz-cairo.so libharfbuzz.so
	  libharfbuzz-icu.so libharfbuzz-gobject.so)
sha256sums=('b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/cpp_std=c++11/cpp_std=c++17/' meson.build
}

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

