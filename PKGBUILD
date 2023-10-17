# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.1.5
pkgrel=1
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots)
makedepends=(libxkbcommon meson pixman wayland-protocols)
source=("git+https://github.com/Hjdskes/${pkgname}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
  ewe-meson -Dxwayland=false -Dman-pages=disabled build "$pkgname"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 "$pkgname/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "$pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
