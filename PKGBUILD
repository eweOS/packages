# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wayvnc
pkgver=0.10.2
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
sha256sums=('c851afc718ccda59ffc3069a15c3a1fc7a4dc1ecb68030faad204590b43f9c0f')

build() {
  ewe-meson wayvnc build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 wayvnc/COPYING -t "${pkgdir}"/usr/share/licenses/wayvnc
}
