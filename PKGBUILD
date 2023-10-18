# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcft
pkgver=3.1.6
pkgrel=2
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
makedepends=(meson tllist)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('95797f945faf407cb658efe6e5dcf0cc3ab08ef01e159383f9cf7cf5ee257506')

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
