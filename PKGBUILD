# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libliftoff
pkgver=0.5.0
pkgrel=1
pkgdesc='Lightweight KMS plane library'
arch=(x86_64 aarch64 riscv64)
url=https://gitlab.freedesktop.org/emersion/libliftoff
license=(MIT)
depends=(libdrm)
makedepends=(
  git
  linux-headers
  meson
)
provides=(libliftoff.so)
source=("git+https://gitlab.freedesktop.org/emersion/libliftoff.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson libliftoff build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 libliftoff/LICENSE -t "${pkgdir}"/usr/share/licenses/libliftoff/
  install -Dm 644 libliftoff/README.md -t "${pkgdir}"/usr/share/doc/libliftoff/
}
