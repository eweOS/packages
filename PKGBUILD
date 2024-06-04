# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayfire
pkgver=0.7.5
pkgrel=2
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64 riscv64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots wf-config nlohmann-json)
makedepends=(meson ninja wayland-protocols glm cmake mesa doctest)
_commit="c48194e055219dcb3a603b59ca37f330a64cac12"
source=("git+https://github.com/WayfireWM/${pkgname}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver()
{
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count v$pkgver..HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  ewe-meson "${pkgname}" build \
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
  cd "${pkgname}"
  install -Dm644 wayfire.desktop "${pkgdir}/usr/share/wayland-sessions/wayfire.desktop"
  install -Dm644 wayfire.ini "${pkgdir}/usr/share/${pkgname}/wayfire.ini"
  install -Dm645 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
