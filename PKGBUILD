# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.2.1
pkgrel=1
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots0.19)
makedepends=(libxkbcommon meson pixman wayland-protocols git linux-headers
	     wlroots0.19-devel)
source=("git+https://github.com/cage-kiosk/cage.git#tag=v$pkgver")
sha512sums=('4cda60e4fcdffeefb5ff8c0b50fee4fe3d008f706d3bae1cc4ac899e3cf72f01da2bb806626fc0043521669136a24f839f672a3670f3b992b4e7584a1bbc6fc1')

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
