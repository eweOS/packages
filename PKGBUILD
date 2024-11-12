# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libyuv
pkgver=r2426+464c51a03
pkgrel=3
pkgdesc="Library for YUV scaling"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://chromium.googlesource.com/libyuv/libyuv/"
license=(custom)
depends=(libjpeg-turbo)
makedepends=(cmake git)
# Version required by libavif
_commit=464c51a0353c71f08fe45f683d6a97a638d47833
source=(
  git+${url}#commit=${_commit}
  fix-loongarch64-lsx.patch
)
sha512sums=('1a149818c4cddaef7963606cac5d6f1e2b6ccf700507ceca7e77f3206853c5f6818044c12af362d1f065c63e1aa9a8f3fde052e86841773417eb98f8ad2d8c69'
            '9bb2ba311b96cf13fca139bceeb89968fbb95d515fb8c18421461acac0edd0283174eb90a039129e8ee19a2bf7335f07fb56df8390a55a835c5e2ebb909063e2')

pkgver() {
  cd ${pkgname}
  printf "r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  _patch_ $pkgname
  sed -i 's|yuvconvert ${JPEG_LIBRARY}|${ly_lib_shared} ${JPEG_LIBRARY}|' ${pkgname}/CMakeLists.txt
}

build() {
  cmake -B build -S ${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

