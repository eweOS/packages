# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=babl
pkgver=0.1.108
pkgrel=1
pkgdesc='Dynamic, any to any, pixel format conversion library'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://gegl.org/babl/'
license=('LGPL-3.0-or-later')
depends=('lcms2')
makedepends=(
    'git'
    'meson'
    'gobject-introspection'
    'vala'
    'gi-docgen'
)
source=("git+https://gitlab.gnome.org/GNOME/babl.git#tag=BABL_${pkgver//./_}")
sha256sums=('82e14ab79ee5b13a10aadd7a3e66517ce802f6bfeb132e75ffb008121090c9f1')

build() {
  ewe-meson "${pkgname}" build
  ninja -C build
}

check() {
  # https://gitlab.gnome.org/GNOME/babl/-/issues/88
  test_list=$(meson test -C build --list) 2> /dev/null
  [ $CARCH != "aarch64" ] || test_list=${test_list//float-to-8bit}
  meson test -C build --print-errorlogs $test_list
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
