# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libva
pkgver=2.21.0
pkgrel=1
pkgdesc='Video Acceleration (VA) API for Linux'
arch=(x86_64 aarch64 riscv64)
url=https://01.org/linuxmedia/vaapi
license=(MIT)
depends=(
  libdrm
  wayland
)
makedepends=(
  git
  libglvnd
  mesa
  meson
)
optdepends=(
  'intel-media-driver: backend for Intel GPUs (>= Broadwell)'
  'libva-intel-driver: backend for Intel GPUs (<= Haswell)'
  'libva-mesa-driver: backend for AMD and NVIDIA GPUs'
)
provides=(
  libva-drm.so
  libva-wayland.so
  libva.so
)
backup=(etc/libva.conf)
source=(git+https://github.com/intel/libva.git#tag=$pkgver)
sha256sums=('SKIP')

build() {
  CFLAGS+=" -DENABLE_VA_MESSAGING" # Option missing
  ewe-meson libva build -D with_x11=no -D with_glx=no -D with_win32=no
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm 644 libva/COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
  install -Dm 644 /dev/stdin "${pkgdir}"/etc/libva.conf <<END
LIBVA_MESSAGING_LEVEL=1
END
}
