# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libass
pkgver=0.17.4
pkgrel=1
pkgdesc='A portable library for SSA/ASS subtitles rendering'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://github.com/libass/libass/
license=(BSD)
depends=(
  fontconfig
  fribidi
  glib
  harfbuzz
  freetype2
)
makedepends=(
  git
  nasm
)
source=(git+https://github.com/libass/libass.git#tag=$pkgver)
sha256sums=('49455d9a4d15b341a5436c49ed451bf3f005ac0eaee486f364ff1b337d8615c0')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --enable-fontconfig
  make
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}"/usr/share/licenses/libass/
}
