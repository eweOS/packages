# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.11.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(linux-headers meson ninja pkgconf wayland-protocols glm doctest cmake git)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('2ed4f1ca7d5ca78c05dc35c88842537cdb4fd3d50362038a4a9b553be6bec80a')

build()
{
  ewe-meson "${pkgname}" build
  ninja -C build
}

check()
{
  meson test -C build
}

package()
{
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
