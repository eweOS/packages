# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=librsvg
pkgname=(
  librsvg
  librsvg-docs
)
pkgver=2.61.0
pkgrel=1
pkgdesc="SVG rendering library"
url="https://wiki.gnome.org/Projects/LibRsvg"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  cairo
  dav1d
  freetype2
  gdk-pixbuf
  glib
  harfbuzz
  libxml2
  pango
)
makedepends=(
  cargo-c
  gi-docgen
  git
  gobject-introspection
  meson
  python-docutils
  rust
  vala
)
checkdepends=(ttf-dejavu)
source=("https://gitlab.gnome.org/GNOME/librsvg/-/archive/$pkgver/librsvg-$pkgver.tar.gz")
sha256sums=('c5b8f42c697dc534bafeeec4799b169ad42915abdcd0701fb636beec51225fb8')

prepare() {
  cd librsvg-$pkgver
  cargo fetch --locked --target "$RUSTHOST"
}

build() {
  local meson_options=(
    -D avif=enabled
  )

  export LDFLAGS="$LDFLAGS -lunwind"

  ewe-meson librsvg-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs --no-rebuild
}

package_librsvg() {
  provides=(librsvg-${pkgver%%.*}.so)

  meson install -C build --destdir "$pkgdir" --no-rebuild

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_librsvg-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}
