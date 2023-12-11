# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcft
pkgver=3.1.6
pkgrel=3
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
sha256sums=('904f40d749d198d97c46c5a459cd3c53fe92f008cf1e3e61949f6cf3036a78b7')

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
