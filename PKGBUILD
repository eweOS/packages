# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wf-config
pkgver=0.8.0
pkgrel=2
pkgdesc="A library for managing configuration files, written for wayfire"
arch=(x86_64 aarch64 riscv64)
url=https://github.com/WayfireWM/wf-config
license=(MIT)
depends=(libevdev libxml2)
makedepends=(meson ninja pkgconf wayland-protocols glm doctest cmake git)
_commit="b0a862533c2d21203bd56df594a1986472876340"
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
