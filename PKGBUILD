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
sha512sums=('SKIP')

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
