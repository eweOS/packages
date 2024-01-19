# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.8.0
pkgrel=1
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkgconf wayland-protocols glm doctest cmake)
_commit="af1bddc9d7191b9902edcb4c74572eac65577806"
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver()
{
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count v$pkgver..HEAD)" "$(git rev-parse --short HEAD)"
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
