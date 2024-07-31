# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayfire
pkgver=0.8.1.r316.44e1fa9c
_pkgver=0.8.1
pkgrel=4
pkgdesc="A modular and extensible wayland compositor"
arch=(x86_64 aarch64 riscv64)
url=https://wayfire.org
license=(MIT)
depends=(cairo pango libjpeg libinput wlroots0.17 wf-config nlohmann-json)
makedepends=(meson ninja wayland-protocols glm cmake mesa doctest git openmp
	     linux-headers wlroots0.17-devel)
_commit="44e1fa9c62e1f8c9f35cedbf3e86c6a0247e0b79"
_refcommit="01726528ace8ed71216f23c3b0fb3344cda5a461" # v0.8.1
source=("git+https://github.com/WayfireWM/${pkgname}.git#commit=$_commit")
sha256sums=('SKIP')

pkgver()
{
  cd $pkgname
  printf "$_pkgver.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
}

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

