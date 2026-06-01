# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=labwc
pkgver=0.20.0
pkgrel=1
pkgdesc='Stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only')
depends=('musl' 'libinput' 'libpng' 'librsvg' 'pango' 'pixman' 'seatd'
	 'wlroots0.20' 'wayland' 'libsfdo' 'libxml2' 'harfbuzz')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'wlroots0.20-devel'
	     'linux-headers')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
sha256sums=('3e0b7cfd8e371ed4826f2d5467749edc7f9d6c06491dd943a55ed1c0b49a369a')

build() {
  ewe-meson -Dman-pages=enabled -Dxwayland=disabled -Dsystemd-session=disabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

