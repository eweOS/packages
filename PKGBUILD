# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=librsvg
pkgver=2.58.2
pkgrel=2
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
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
source=("https://gitlab.gnome.org/GNOME/librsvg/-/archive/$pkgver/librsvg-$pkgver.tar.gz"
	"link-libunwind-in-test.patch")
sha256sums=('22a7e326710d28f8f73d28de423ee0d1a61fb12f9e830d3e9ffe825a20edd348'
	    '06b352f424d44e5d87751b91136c308e12d16f229b5c906a974c24f69079f85e')

prepare() {
  _patch_ librsvg-$pkgver

  cd librsvg-$pkgver
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-static
  )

  cd librsvg-$pkgver
  export LDFLAGS="$LDFLAGS -lunwind"
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make
}

check() {
  # Test suite is very dependent on the versions of
  # Cairo, Pango, FreeType and HarfBuzz
  # Tests need nightly features
  RUSTC_BOOTSTRAP=1 make -C librsvg-$pkgver check || :
}

package_librsvg() {
  provides=(librsvg-${pkgver%%.*}.so)

  make -C librsvg-$pkgver DESTDIR="$pkgdir" install
}
