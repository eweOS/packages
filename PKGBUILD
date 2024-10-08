# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-shell
pkgver=0.9.0
pkgrel=1
pkgdesc='GTK3-based panel for the Wayfire compositor'
url=https://wayfire.org
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(wf-config gtkmm3 gtk-layer-shell libdbusmenu-gtk3 libpulse alsa-lib)
makedepends=(wayland wayfire wlroots0.17-devel wayland-protocols meson ninja git gobject-introspection glib2 glm)
source=("${pkgname}::git+https://github.com/WayfireWM/wf-shell#tag=v$pkgver")
sha512sums=('99926b6ea6f74ca2f6bc3523c4822ad17d4482f9bdb2d0fa48f26f9d6583f65a03de7ac546d973001cc021c29d39ddfa8c96628a9fd1846a21bde919523e6131')

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
