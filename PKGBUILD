# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.10.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(linux-headers meson ninja pkgconf wayland-protocols glm doctest cmake git)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('e83a4847048c7c06a7f361f1a334f34ab2e07cf4cff6c150f66d8bcedca9c5eb')

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
