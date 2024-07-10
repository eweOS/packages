# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.9.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(linux-headers meson ninja pkgconf wayland-protocols glm doctest cmake git)
_ver_commit="3da1c2254e645ba139b0db268349eb00d65162a6" # 0.9.0 version
_commit="fd420e8ae6bfda7fb0c4979c198dd82db6c3bd72"
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver()
{
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count ${_ver_commit}..HEAD)" "$(git rev-parse --short HEAD)"
}

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
