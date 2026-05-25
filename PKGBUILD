# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraqm
pkgver=0.10.5
pkgrel=1
pkgdesc='A library that encapsulates the logic for complex text layout'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/HOST-Oman/libraqm/'
license=(MIT)
depends=(freetype2
         fribidi
         harfbuzz)
makedepends=(git
             gtk-doc
             meson)
source=(git+https://github.com/HOST-Oman/libraqm#tag=v$pkgver)
sha256sums=('778c71f6d4f8708d019a1da1ef666492b3c1e5dea4ba86663f47d5e21b431f61')

build() {
  ewe-meson libraqm build -D docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -D -m644 libraqm/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
