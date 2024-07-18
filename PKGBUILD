# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vapoursynth
pkgver=R69
pkgrel=1
pkgdesc='A video processing framework with the future in mind'
arch=(x86_64 aarch64 riscv64)
url=http://www.vapoursynth.com/
license=(
  LGPL2.1
  custom:OFL
)
depends=(
  libzimg.so
  python
)
makedepends=(
  cython
  git
)
source=(
  git+https://github.com/vapoursynth/vapoursynth.git#tag=$pkgver
  vapoursynth.xml
)
sha256sums=('SKIP'
            '71b26d66d42b9176b4f41e2f79685b8afb4d66c61e21b9aa3e84d87d3508567f')

prepare() {
  cd vapoursynth
  ./autogen.sh
}

build() {
  if [ "$CARCH" == "aarch64" ]; then
    export CFLAGS="$CFLAGS -mno-outline-atomics"
  fi

  cd vapoursynth
  ./configure \
    --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd vapoursynth

  make DESTDIR="${pkgdir}" install

  install -Dm 644 src/core/ter-116n.ofl.txt -t "${pkgdir}"/usr/share/licenses/vapoursynth/
  install -Dm 644 ../vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}
