# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraqm
pkgver=0.10.3
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
sha256sums=('c7cb864437cce83cfd00d8309027c0b1a908506c260bce234310d2df57042d80')

build() {
  ewe-meson libraqm build -D docs=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -D -m644 libraqm/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
