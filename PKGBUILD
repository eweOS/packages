# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayfire
pkgver=0.10.0
pkgrel=1
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots0.19 wf-config yyjson)
makedepends=(meson ninja wayland-protocols glm cmake mesa doctest git openmp
	     linux-headers wlroots0.19-devel vulkan-icd-loader)
source=("git+https://github.com/WayfireWM/${pkgname}.git#tag=v$pkgver")
sha256sums=('ceddf00fad33242b8f8236410fa4e0709197bf156b2023df8ec2a3b1a88d2aee')

build()
{
  export CFLAGS="${CFLAGS/-O? /-O0 }"
  export CXXFLAGS="${CXXFLAGS/-O? /-O0 }"
  ewe-meson "${pkgname}" build \
    -Duse_system_wlroots=enabled \
    -Duse_system_wfconfig=enabled \
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

