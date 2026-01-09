# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=labwc
pkgver=0.9.3
pkgrel=1
pkgdesc='Stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only')
depends=('musl' 'libinput' 'libpng' 'librsvg' 'pango' 'pixman' 'seatd'
	 'wlroots0.19' 'wayland' 'libsfdo' 'libxml2' 'harfbuzz')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'wlroots0.19-devel'
	     'linux-headers')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
sha256sums=('38d273faa4e021b9f99e1bf1a5f4bf881cc6a592e00c7b3426b37c0a0b67d126')

build() {
  ewe-meson -Dman-pages=enabled -Dxwayland=disabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

