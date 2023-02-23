# Maintainer: Yukari Chiba <i@0x7f.cc>
pkgname=wayfire
pkgver=0.7.5
pkgrel=1
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots wf-config)
makedepends=(meson ninja wayland-protocols glm cmake libglvnd doctest)
source=("https://github.com/WayfireWM/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('SKIP')

build()
{
  ewe-meson "${pkgname}-${pkgver}" build \
    -Duse_system_wlroots=enabled \
    -Dxwayland=disabled
  ninja -C build
}

check()
{
  meson test -C build
}

package()
{
  DESTDIR="${pkgdir}/" ninja -C build install
  cd "${pkgname}-${pkgver}"
  install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
  install -Dm644 wayfire.ini "${pkgdir}/usr/share/${pkgname}/wayfire.ini"
  install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
