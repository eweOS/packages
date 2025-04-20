# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vapoursynth
pkgver=R71
pkgrel=1
pkgdesc='A video processing framework with the future in mind'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=http://www.vapoursynth.com/
license=(LGPL-2.1-only OFL-1.1)
depends=(
  musl
  zimg
  python
)
makedepends=(
  cython
  git
)
source=(
  https://github.com/vapoursynth/vapoursynth/archive/$pkgver.tar.gz
  vapoursynth.xml
)
sha256sums=('c56d6de16d0a24db7eee1bd5e633229b0bd8a746eafcfe41945a22f9d44f8bd6'
            '71b26d66d42b9176b4f41e2f79685b8afb4d66c61e21b9aa3e84d87d3508567f')

prepare() {
  cd vapoursynth-$pkgver
  ./autogen.sh
}

build() {
  cd vapoursynth-$pkgver

  ./configure \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd vapoursynth-$pkgver

  make DESTDIR="${pkgdir}" install

  _install_license_ src/core/ter-116n.ofl.txt
  install -Dm 644 ../vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}
