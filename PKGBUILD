# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.1.4
pkgrel=2
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots)
makedepends=(libxkbcommon meson pixman wayland-protocols)
_commit=""5f4c43db04093edf8452efb3b04c3a3c720c78de
source=("https://github.com/Hjdskes/cage/archive/${_commit}.tar.gz")
sha512sums=('0a6a493a5c5818c486dfebe63643432aea8a709fad8618251e93c0e1fb45334bc95ca69b9e1be53f4afe9135207aef8017767ae1ed269712218b13e9606119cb')

build() {
  ewe-meson -Dxwayland=false -Dman-pages=disabled build "$pkgname-${_commit}"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 "$pkgname-${_commit}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "$pkgname-${_commit}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
