# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=harfbuzz
pkgver=8.5.0
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
sha256sums=('77e4f7f98f3d86bf8788b53e6832fb96279956e1c3961988ea3d4b7ca41ddc27')

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

