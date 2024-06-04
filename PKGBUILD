# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glm
pkgver=1.0.1
pkgrel=1
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification"
arch=(x86_64 aarch64 riscv64)
license=('MIT')
url="http://glm.g-truc.net"
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/g-truc/glm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('c6c6fa1ea7a7e97820e36ee042a78be248ae828c99c1b1111080d9bf334a5160c9993a70312351c92a867cd49907c95f9f357c8dfe2bc29946da6e83e27ba20c')

prepare() {
  sed -i 's/-Weverything//' $pkgname-$pkgver/test/CMakeLists.txt
}

build() {
  cmake -S ${pkgname}-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_DATAROOTDIR=/usr/lib/cmake \
    -W no-dev
  cmake --build build --verbose
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  mkdir -p "$pkgdir"/usr/share/doc
  cp -r ${pkgname}-${pkgver}/doc "$pkgdir"/usr/share/doc/glm

  install -vDm 644 ${pkgname}-${pkgver}/copying.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
