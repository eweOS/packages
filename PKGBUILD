# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.3.1
pkgrel=1
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots0.20)
makedepends=(libxkbcommon meson pixman wayland-protocols git linux-headers
	     wlroots0.20-devel)
source=("git+https://github.com/cage-kiosk/cage.git#tag=v$pkgver")
sha512sums=('8ec49b256c82b0ad548e389b89ae251365c4df4a2fbf417f33ba68a2ecab50833e8c2dd58bed65b2b38a31318926e126c13d20ff081c11c63d2b50bc1072e88b')

build() {
  ewe-meson -Dman-pages=disabled build "$pkgname"
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
