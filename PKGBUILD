# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=aml
pkgver=1.0.0
pkgrel=1
pkgdesc='Another Main Loop'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/any1/aml
license=(custom:ISC)
makedepends=(
  git
  meson
  ninja
)
provides=(libaml.so)
source=("git+https://github.com/any1/aml.git#tag=v$pkgver")
sha256sums=('53b9fded14f6c61e1b4fa41f1b5995a70207bebcbf468918690b2171bb79e6c0')


build() {
  ewe-meson aml build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 aml/COPYING -t "${pkgdir}"/usr/share/licenses/aml
}
