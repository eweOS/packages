# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkgconf wayland-protocols glm doctest cmake)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('16988f63fd054b446d4feac024aafd4cc962193d6d6dfde90e6d6169c23443af')

build()
{
  ewe-meson "${pkgname}-${pkgver}" build
  ninja -C build
}

check()
{
  meson test -C build
}

package()
{
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
