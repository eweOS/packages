# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcft
pkgver=3.1.10
pkgrel=1
pkgdesc='Simple library for font loading and glyph rasterization'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://codeberg.org/dnkl/${pkgname}
license=(MIT)
depends=(
  fontconfig
  freetype2
  harfbuzz
  libutf8proc
  pixman
)
makedepends=(meson scdoc tllist git)
source=("git+$url#tag=${pkgver}")
sha256sums=('83599a022813978007e9193c38911d155df2983a5e7a52f748e39368be3428a0')

build() {
  ewe-meson $pkgname build \
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
