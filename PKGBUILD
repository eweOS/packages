# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=neatvnc
pkgver=0.8.0
pkgrel=2
pkgdesc='Fast and neat VNC server library'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/any1/neatvnc
license=(custom:ISC)
depends=(
  libaml.so
  libavcodec.so
  libdrm
  libpixman-1.so
  libturbojpeg.so
  mesa
  zlib
  nettle
)
makedepends=(
  git
  meson
  ninja
)
provides=(libneatvnc.so)
source=(git+https://github.com/any1/neatvnc.git#tag=v$pkgver)
sha256sums=('SKIP')

build() {
  ewe-meson neatvnc build -D tls=disabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 neatvnc/COPYING -t "${pkgdir}"/usr/share/licenses/neatvnc
}
