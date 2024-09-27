# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayfire
pkgver=0.9.0
pkgrel=1
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64 riscv64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots0.17 wf-config nlohmann-json)
makedepends=(meson ninja wayland-protocols glm cmake mesa doctest git openmp
	     linux-headers wlroots0.17-devel)
source=("git+https://github.com/WayfireWM/${pkgname}.git#tag=v$pkgver")
sha256sums=('bb96bff746dd22f35cbc63c366566fc5552d9edac89edbb9d345206dbddc8cf7')

build()
{
  export CFLAGS="${CFLAGS/-O? /-O0 }"
  export CXXFLAGS="${CXXFLAGS/-O? /-O0 }"
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

