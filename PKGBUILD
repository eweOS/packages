# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcft
pkgver=3.3.2
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
  nanosvg
  pixman
)
makedepends=(meson scdoc tllist git)
checkdepends=(check ttf-noto-fonts-emoji ttf-unifont)
source=("git+$url#tag=${pkgver}")
sha256sums=('43ede5629f872ea057492ff3aa1fd0385c0c3d05ad85ae686d423dab4f2cc8d7')

build() {
  ewe-meson $pkgname build \
    -D grapheme-shaping=enabled \
    -D run-shaping=enabled \
    -D test-text-shaping=true \
    -D system-nanosvg=enabled
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
  install -Dm0644 "$pkgname/unicode/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.unicode"
}
