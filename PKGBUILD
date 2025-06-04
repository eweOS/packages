# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=labwc
pkgver=0.8.4
pkgrel=3
pkgdesc='Stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only')
depends=('musl' 'libinput' 'libpng' 'librsvg' 'pango' 'pixman' 'seatd'
	 'ttf-font' 'wlroots0.18' 'wayland' 'libsfdo' 'libxml2' 'harfbuzz')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'wlroots0.18-devel'
	     'linux-headers')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
sha256sums=('2d3ded90f78efb5060f7057ea802c78a79dc9b2e82ae7a2ad902af957b8b9797')

build() {
  ewe-meson -Dman-pages=enabled -Dxwayland=disabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

