# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cage
pkgver=0.1.5
pkgrel=3
pkgdesc="A kiosk compositor for Wayland"
arch=(x86_64 aarch64 riscv64)
url="https://www.hjdskes.nl/projects/cage/"
license=(MIT)
depends=(wayland wlroots)
makedepends=(libxkbcommon meson pixman wayland-protocols git)
_commit=b6f8f925854cd90592b6f8abb4c8393ec51c9571
source=("git+https://github.com/cage-kiosk/cage.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  ewe-meson -Dxwayland=disabled -Dman-pages=disabled build "$pkgname"
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -vDm 644 "$pkgname/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "$pkgname/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
