# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=librsvg
pkgver=2.57.1
pkgrel=1
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  cairo
  freetype2
  gdk-pixbuf
  glib
  harfbuzz
  libxml2
  pango
)
makedepends=(
  git
  gobject-introspection
  rust
  python
)
checkdepends=(ttf-dejavu)
source=(
  "git+https://gitlab.gnome.org/GNOME/librsvg.git#tag=$pkgver"
)
sha256sums=('SKIP')

prepare() {
  cd librsvg
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-static
  )

  cd librsvg
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  # Tests need nightly features
  # FIXME: error with libunwind: undefined symbol
  RUSTC_BOOTSTRAP=1 make -C librsvg check || :
}

package_librsvg() {
  provides=(librsvg-${pkgver%%.*}.so)

  make -C librsvg DESTDIR="$pkgdir" install
}
