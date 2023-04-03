# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.7.1
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkgconf wayland-protocols glm doctest cmake)
source=("$url/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('7d2285adeaca0ff6e36e6ef450564ab02c8e26ba5da3b169257c5bf061f7e5f0')

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
