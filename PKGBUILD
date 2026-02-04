# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdecor
pkgdesc='Client-side decorations library for Wayland clients'
pkgver=0.2.5
pkgrel=1
url="https://gitlab.freedesktop.org/libdecor/libdecor"
license=('MIT')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('wayland' 'pango' 'dbus')
makedepends=('cmake' 'ninja' 'meson' 'wayland-protocols' 'gtk3' 'linux-headers')
optdepends=('gtk3: gtk3 support')
source=("https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${pkgver}/libdecor-${pkgver}.tar.gz")
sha512sums=('c696ed38a80256e1db68fcc0fd8a8c18439c4a1c4bf4d7e4068a741b0e2642d99dc07ae92e209c15f2387ea9330f9b3281ab9114b5d8989e085165f3eae6abed')

build() {
  ewe-meson -Ddemo=false build "${pkgname}-${pkgver}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
