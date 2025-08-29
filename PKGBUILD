# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.10.0
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://wayfire.org
license=(MIT)
depends=(wayfire wf-shell gtkmm3 wdisplays wlroots0.19)
optdepends=('wdisplays: display configuration tool')
makedepends=(wayland-protocols meson ninja glm wlroots0.19-devel linux-headers)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('38b912dcaaf52f7585414b5b40a694b0706ed5570e17703bc3d07654646ba707')

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

