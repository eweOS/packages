# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdecor
pkgdesc='Client-side decorations library for Wayland clients'
pkgver=0.2.4
pkgrel=1
url="https://gitlab.freedesktop.org/libdecor/libdecor"
license=('MIT')
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('wayland' 'pango' 'dbus')
makedepends=('cmake' 'ninja' 'meson' 'wayland-protocols' 'gtk3' 'linux-headers')
optdepends=('gtk3: gtk3 support')
source=("https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${pkgver}/libdecor-${pkgver}.tar.gz")
sha512sums=('f9b8a1af992132e150571d2df2d6dab1e0a5ed8f7608109111a6339aca3ae395ffa5d962f079b0a3725a4bec3f86d8386720cf8c60e65dc980d9b186c7ebe3fb')

build() {
  ewe-meson -Ddemo=false build "${pkgname}-${pkgver}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
