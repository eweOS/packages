# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libxcvt
pkgver=0.1.3
pkgrel=1
pkgdesc="library providing a standalone version of the X server implementation of the VESA CVT standard timing modelines generator"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://gitlab.freedesktop.org/xorg/lib/libxcvt"
license=('MIT' 'HPND-sell-variant')
makedepends=('meson')
source=(https://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.xz)
sha512sums=('2fecc784375e69b6e8e46608618a5f5a8ad20ecd5229fd093883fe401dd6ea231d8b77c6753756fff01f3040bef2db60a042d40fc349769ef5348e5cd9ed1f28')

build() {
  ewe-meson ${pkgname}-${pkgver} build
  meson compile -C build
}

check() {
  meson test -C build #--print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/COPYING"
}

