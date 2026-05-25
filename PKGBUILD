# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayvnc
pkgver=0.10.0
pkgrel=1
pkgdesc='VNC server for wlroots-based Wayland compositors'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/any1/wayvnc
license=(custom:ISC)
depends=(
  jansson
  libaml.so
  libdrm
  libneatvnc.so
  libpixman-1.so
  libxkbcommon.so
  wayland
)
# sys/queue.h requires bsd-compat-headers
makedepends=(
  bsd-compat-headers
  git
  meson
  ninja
  pam
  scdoc
)
optdepends=('pam: PAM authentication')
source=(git+https://github.com/any1/wayvnc.git#tag=v${pkgver})
sha256sums=('1dd8633b70f8ba889f49bba1612b714174d4e587430dff7b1e3a518e389c5021')

build() {
  ewe-meson wayvnc build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 wayvnc/COPYING -t "${pkgdir}"/usr/share/licenses/wayvnc
}
