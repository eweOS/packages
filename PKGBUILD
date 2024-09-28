# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgdesc='Wayfire Configuration Manager'
pkgname=wcm
pkgver=0.9.0
pkgrel=1
arch=(x86_64 aarch64 riscv64)
url=https://wayfire.org
license=(MIT)
depends=(wayfire wf-shell gtkmm3 wdisplays wlroots0.17)
optdepends=('wdisplays: display configuration tool')
makedepends=(wayland-protocols meson ninja glm wlroots0.17-devel linux-headers)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('8c8605ccb720fb24e58f16c2e2727cd07b6754bd441c9a3f0e715548b4e7c4ae')

build ()
{
  rm -rf build
  ewe-meson "${pkgname}-${pkgver}" build \
    -Dwf_shell=enabled \
    -Denable_wdisplays=false
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

