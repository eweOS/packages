# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.11.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://wayfire.org
license=(MIT)
depends=(fmt wayfire wf-shell gtkmm3 wdisplays wlroots0.20)
optdepends=('wdisplays: display configuration tool')
makedepends=(wayland-protocols meson ninja glm wlroots0.20-devel linux-headers)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build ()
{
  rm -rf build
  ewe-meson "${pkgname}-${pkgver}" build
  ninja -C build
}

check () {
  meson test -C build
}

package ()
{
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
