# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=neatvnc
pkgver=1.0.4
pkgrel=1
pkgdesc='Fast and neat VNC server library'
arch=(x86_64 aarch64 riscv64 loongarch64)
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
  linux-headers
  meson
  ninja
)
provides=(libneatvnc.so)
source=(git+https://github.com/any1/neatvnc.git#tag=v$pkgver)
sha256sums=('1b1e2c0884f808576222cd101a64205494ac5fb5eb52482457a02e5bebc079b1')

build() {
  ewe-meson neatvnc build -D tls=disabled
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 neatvnc/COPYING -t "${pkgdir}"/usr/share/licenses/neatvnc
}
