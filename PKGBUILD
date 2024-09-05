# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=labwc
pkgver=0.8.0
pkgrel=1
pkgdesc='stacking wayland compositor with look and feel from openbox'
url="https://github.com/labwc/labwc"
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL-2.0-only')
depends=('libpng' 'librsvg' 'pango' 'seatd' 'ttf-font' 'wlroots0.18' 'wayland')
makedepends=('meson' 'scdoc' 'wayland-protocols' 'wlroots0.18-devel' 'linux-headers')
optdepends=("bemenu: default launcher via Alt+F3")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/labwc/labwc/archive/${pkgver}.tar.gz")
sha256sums=('1bfe5791c6002c1355821046623fa64231afd42e4d2ec1f6a9af44ef3b24f780')

build() {
  ewe-meson -Dman-pages=enabled -Dxwayland=disabled "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

