# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=labwc
pkgver=0.8.2
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'wlroots0.18' 'wayland'
	 'libsfdo')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'wlroots0.18-devel'
	     'linux-headers')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
sha256sums=('1adba1c87ec26f2f00409b47a0b79ccfd68bd160e1abc41822fb01f0a76ee947')

build() {
  ewe-meson -Dman-pages=enabled -Dxwayland=disabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

