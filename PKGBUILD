# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-shell
pkgver=0.10.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(wf-config gtkmm3 gtk-layer-shell libdbusmenu-gtk3 libpulse alsa-lib wlroots0.19)
makedepends=(wayland wayfire wayland-protocols meson ninja git gobject-introspection glib2 glm wlroots0.19-devel)
source=("${pkgname}::git+https://github.com/WayfireWM/wf-shell#tag=v$pkgver")
sha512sums=('6c2b6504bb7547d8626e816385e62c3a92c0662589c20b07498d2658311374371ac0fbfaed771290d9eb6b2cc0c2f545b5111ec7d812523bd08582b5a4c816ee')

build () {
  ewe-meson "${pkgname}" build -Dpulse=enabled
  meson compile -C build
}

package () {
  meson install -C build --destdir "$pkgdir"
  cd "${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
