# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libspng
pkgver=0.7.4
pkgrel=1
pkgdesc='Simple, modern libpng alternative'
arch=(x86_64 aarch64 riscv64)
url=https://github.com/randy408/libspng
license=(BSD-2-Clause)
depends=(
  zlib
)
makedepends=(
  git
  meson
)
provides=(libspng.so)
source=("git+https://github.com/randy408/libspng.git#tag=v$pkgver")
sha256sums=('7cb4d508761d619b36e9cfda67dfc9186ad2f6799f0dcee09884660e394fb84a')

build() {
  ewe-meson build libspng \
    -Dbuild_examples=false
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm 644 libspng/LICENSE -t "${pkgdir}"/usr/share/licenses/libspng/
}
