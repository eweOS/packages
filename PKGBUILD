# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libdecor
pkgdesc='Client-side decorations library for Wayland clients'
pkgver=0.2.2
pkgrel=1
url="https://gitlab.freedesktop.org/libdecor/libdecor"
license=('MIT')
arch=(x86_64 aarch64 riscv64)
depends=('wayland' 'pango' 'dbus')
makedepends=('cmake' 'ninja' 'meson' 'wayland-protocols' 'gtk3')
optdepends=('gtk3: gtk3 support')
source=("https://gitlab.freedesktop.org/libdecor/libdecor/-/archive/${pkgver}/libdecor-${pkgver}.tar.gz")
sha512sums=('ddaaa75f1dc983e6d59e168896f8044cf6ac761675db6af410c6d2186bdc66942c98f36eb7a6e2836ce02dbb98189a80db30b7cef3dbaf49c7aae47c3eee22cc')

build() {
  ewe-meson -Ddemo=false build "${pkgname}-${pkgver}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
