# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=svt-av1
pkgver=3.1.2
pkgrel=1
pkgdesc='Scalable Video Technology AV1 encoder and decoder'
arch=(x86_64 aarch64 riscv64 loongarch64)
url=https://gitlab.com/AOMediaCodec/SVT-AV1
license=(
  BSD
  'custom: Alliance for Open Media Patent License 1.0'
)
makedepends=(
  cmake
  git
  nasm
  ninja
)
source=("git+https://gitlab.com/AOMediaCodec/SVT-AV1.git#tag=v${pkgver}")
sha256sums=('8313ba8b8398db36db9f52fdd2c5f02199c0fa7b1fcdeca054b2f3a7bbece673')

prepare() {
  sed '/CMAKE_BUILD_TYPE Release/d' -i SVT-AV1/CMakeLists.txt
}

build() {
  cmake -S SVT-AV1 -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DNATIVE=OFF
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm 644 SVT-AV1/{LICENSE,PATENTS}.md -t "${pkgdir}"/usr/share/licenses/svt-av1/
}
