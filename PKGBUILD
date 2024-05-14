# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=aml
pkgver=0.3.0
pkgrel=1
pkgdesc='Another Main Loop'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/any1/aml
license=(custom:ISC)
makedepends=(
  git
  meson
  ninja
)
provides=(libaml.so)
_commit=ef33f2d8d1187afbf89b07f84ad9e82a1a87e8e4
source=(git+https://github.com/any1/aml.git#tag=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  ewe-meson aml build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 aml/COPYING -t "${pkgdir}"/usr/share/licenses/aml
}
