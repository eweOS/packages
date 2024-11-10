# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=harfbuzz
pkgname=(
  harfbuzz
  harfbuzz-cairo
  harfbuzz-icu
  harfbuzz-utils
  harfbuzz-docs
)
pkgver=10.1.0
pkgrel=1
pkgdesc="OpenType text shaping engine"
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(glib freetype2 graphite)
makedepends=(
  cairo
  git
  gobject-introspection
  gtk-doc
  icu
  meson
  python
  ragel
)
checkdepends=(
  python-fonttools
  python-setuptools
)
source=("https://github.com/harfbuzz/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
provides=(libharfbuzz-subset.so libharfbuzz-cairo.so libharfbuzz.so
	  libharfbuzz-icu.so libharfbuzz-gobject.so)
sha256sums=('6ce3520f2d089a33cef0fc48321334b8e0b72141f6a763719aaaecd2779ecb82')

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
    -D cpp_std=c++17 \
    -D graphite2=enabled
  meson compile -C build
}

check() {
  mkdir -p tmp
  # FIXME: check-symbol fails
  if [ "$CARCH" == "x86_64" ]; then
  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs
  else
  TMPDIR="$PWD/tmp" meson test -C build --print-errorlogs || :
  fi
  rm -r tmp
}

package_harfbuzz() {
  depends+=(
    libfreetype.so
    libgraphite2.so
    libg{lib,object}-2.0.so
  )
  optdepends=('harfbuzz-utils: utilities')
  provides=(libharfbuzz{,-subset,-gobject}.so)
  meson install -C build --destdir "$pkgdir"

  ( cd "$pkgdir"

    _pick_ hb-cairo usr/lib/libharfbuzz-cairo*
    _pick_ hb-cairo usr/lib/pkgconfig/harfbuzz-cairo.pc
    _pick_ hb-cairo usr/include/harfbuzz/hb-cairo.h

    _pick_ hb-icu usr/lib/libharfbuzz-icu*
    _pick_ hb-icu usr/lib/pkgconfig/harfbuzz-icu.pc
    _pick_ hb-icu usr/include/harfbuzz/hb-icu.h

    _pick_ hb-utils usr/bin

    _pick_ hb-docs usr/share/gtk-doc
  )

  _install_license_ $pkgbase-$pkgver/COPYING
}

package_harfbuzz-cairo() {
  pkgdesc+=" - Cairo integration"
  depends=(
    cairo
    freetype2
    glib2
    graphite
    harfbuzz
    libcairo.so
    libharfbuzz.so
  )
  provides=(libharfbuzz-cairo.so)

  mv $srcdir/pkgs/hb-cairo/* "$pkgdir"

  _install_license_ $pkgbase-$pkgver/COPYING
}

package_harfbuzz-icu() {
  pkgdesc+=" - ICU integration"
  depends=(
    harfbuzz
    icu
    libharfbuzz.so
    libicuuc.so
  )
  provides=(libharfbuzz-icu.so)

  mv $srcdir/pkgs/hb-icu/* "$pkgdir"

  _install_license_ $pkgbase-$pkgver/COPYING
}

package_harfbuzz-utils() {
  pkgdesc+=" - Utilities"
  depends=(
    cairo
    freetype2
    glib2
    harfbuzz
    harfbuzz-cairo
    libcairo.so
    libfreetype.so
    libglib-2.0.so
    libgobject-2.0.so
    libharfbuzz-cairo.so
    libharfbuzz-gobject.so
    libharfbuzz-subset.so
    libharfbuzz.so
  )

  mv $srcdir/pkgs/hb-utils/* "$pkgdir"

  _install_license_ $pkgbase-$pkgver/COPYING
}

package_harfbuzz-docs() {
  pkgdesc+=" - Documentation"
  depends=()

  mv $srcdir/pkgs/hb-docs/* "$pkgdir"

  _install_license_ $pkgbase-$pkgver/COPYING
}
