# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcft
pkgver=3.1.8
pkgrel=1
pkgdesc='Simple library for font loading and glyph rasterization'
arch=(x86_64 aarch64 riscv64)
url=https://codeberg.org/dnkl/${pkgname}
license=(MIT)
depends=(
  fontconfig
  freetype2
  harfbuzz
  libutf8proc
  pixman
)
makedepends=(meson tllist git)
source=("git+$url#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  ewe-meson $pkgname build \
    -D docs=disabled \
    -D grapheme-shaping=enabled \
    -D run-shaping=enabled
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
  install -Dm0644 "$pkgname/unicode/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.unicode"
}
