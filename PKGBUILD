# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-shell
pkgver=0.8.1
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(wf-config gtkmm3 gtk-layer-shell libdbusmenu-gtk3 libpulse alsa-lib)
makedepends=(wayland wayfire wlroots0.17-devel wayland-protocols meson ninja git gobject-introspection glib2 glm)
source=("${pkgname}::git+https://github.com/WayfireWM/wf-shell#tag=v$pkgver")
sha512sums=('f6d485e4934de8fe0855ba0a0e3c04efd1533c3a1d96f18d2b561f075d97de23c45878fd8580ca5edd996809e58635ce0d9855d59bb19692d24518567ab9fae3')

build () {
  ewe-meson "${pkgname}" build -Dpulse=enabled
  meson compile -C build
}

package () {
  depends+=('ttf-font')
  meson install -C build --destdir "$pkgdir"
  cd "${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 wf-shell.ini.example "${pkgdir}/usr/share/doc/${pkgname}/wf-shell.ini.example"
}
