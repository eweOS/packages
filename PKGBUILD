# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdecor
pkgdesc='Client-side decorations library for Wayland clients'
pkgver=0.2.3
pkgrel=1
url="https://gitlab.freedesktop.org/libdecor/libdecor"
license=('MIT')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('wayland' 'pango' 'dbus')
makedepends=('cmake' 'ninja' 'meson' 'wayland-protocols' 'gtk3' 'linux-headers')
optdepends=('gtk3: gtk3 support')
source=("https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${pkgver}/libdecor-${pkgver}.tar.gz")
sha512sums=('99eefab6343a3ea066a5d9b81baaa0db3dc5ad7d71ce55852c4dd005c2b980e066639ed88e2e3a247c30cda23665343b040ed7383b17ac3ad31498af52d9c76e')

build() {
  ewe-meson -Ddemo=false build "${pkgname}-${pkgver}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
