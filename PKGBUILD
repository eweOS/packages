# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraqm
pkgver=0.10.4
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
sha256sums=('bba0ad6c2c5861ee0b1db2673ef63a1ea93d4af390b465743e3fc68eb3283c82')

build() {
  ewe-meson libraqm build -D docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -D -m644 libraqm/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
