# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.2.0
pkgrel=2
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots0.18)
makedepends=(libxkbcommon meson pixman wayland-protocols git linux-headers
	     wlroots0.18-devel)
source=("git+https://github.com/cage-kiosk/cage.git#tag=v$pkgver")
sha512sums=('fbf43968560ee4d83ade87804aac9dbc8fe61f783909bad5a4403937d7f0070894373bc21fab9f1d1e425126a9b86c99c2acb5fee30f7cc9b23c40e453c9df21')

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
