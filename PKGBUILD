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
sha256sums=('cbd5421df85ba58228ea373cc452ca677e0e2ec61b59944d7e514234633057d9'
            '71b26d66d42b9176b4f41e2f79685b8afb4d66c61e21b9aa3e84d87d3508567f')

prepare() {
  cd vapoursynth-$pkgver
  ./autogen.sh
}

build() {
  cd vapoursynth-$pkgver

  case $CARCH in
    aarch64)
      CFLAGS="$CFLAGS -mno-outline-atomics"
      CXXFLAGS="$CXXFLAGS -mno-outline-atomics" ;;
    *) ;;
  esac

  export CFLAGS CXXFLAGS
  ./configure \
    --prefix=/usr \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd vapoursynth-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm 644 src/core/ter-116n.ofl.txt -t "${pkgdir}"/usr/share/licenses/vapoursynth/
  install -Dm 644 ../vapoursynth.xml -t "${pkgdir}"/usr/share/mime/packages/
}
